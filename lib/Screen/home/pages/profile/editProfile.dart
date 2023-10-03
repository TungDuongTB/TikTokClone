import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tiktok/controllers/login&signup/signup_controller.dart';
import 'package:tiktok/database/models/user.dart';
import 'package:tiktok/database/models/user_repository.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  late User _user;
  final UserRepository _userRepository = UserRepository();
  final controller = Get.put(SignUpController());
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loadUserData();
  }
  void _loadUserData() async {
    final  SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? email = prefs.getString('email');
    print(email);
    User? user = await _userRepository.getUserByEmail(email.toString());
    if (user != null) {
      setState(() {
        _user = user;
      });
    } else {
      // Handle user not found error
    }
  }
  bool isObscurePassword=true;
  @override
  Widget build(BuildContext context) {
    final email = TextEditingController(text: _user.email);
    final fullname = TextEditingController(text: _user.fullname);
    final phone = TextEditingController(text: _user.phoneNo);
    final gender = TextEditingController(text: _user.gender);
    final age = TextEditingController(text: _user.age);
    final password = TextEditingController(text: _user.password);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(
          color: Colors.black
        ),
      ),
      body: Container(
        padding: EdgeInsets.only(left: 15,top: 20,right: 15),
        child: GestureDetector(
          onTap: (){
            FocusScope.of(context).unfocus();
          },
          child: ListView(
            children: [
              Center(
                child: Stack(
                  children: [
                    Container(
                      width: 130,
                      height: 130,
                      decoration: BoxDecoration(
                        border: Border.all(width: 4,color: Colors.white),
                        boxShadow: [
                          BoxShadow(
                            spreadRadius: 2,
                            blurRadius: 10,
                            color: Colors.black.withOpacity(0.1),
                          )
                        ],
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage("${_user.profileImageUrl}"),
                        )
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                        right: 0,
                        child: Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              width: 4,
                              color: Colors.white
                            ),
                            color: Colors.redAccent,
                          ),
                          child: Icon(
                            Icons.edit,
                            color: Colors.white,
                          ),

                    )
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30),
              buildTextField("Full Name",fullname,"${_user.fullname}",true,false),
              buildTextField("Email",email,"${_user.email}",true,false),
              buildTextField("Password",password,"********",false,true),
              buildTextField("Phone",phone,"${_user.phoneNo}",true,false),
              buildTextField("Age",age,"${_user.age}",true,false),
              buildTextField("Gender",gender,"${_user.gender}",true,false),
              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  OutlinedButton(onPressed: (){},
                      child: Text("CANCEL",style: TextStyle(
                        fontSize: 15,
                        letterSpacing: 2,color: Colors.black
                      ),
                      ),
                    style: OutlinedButton.styleFrom(
                      padding: EdgeInsets.symmetric(horizontal: 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                  ElevatedButton(
                      onPressed: (){
                        SignUpController.instance.editUser(context, controller.email.text.trim(), controller.phone.text.trim(), controller.age.text.trim(), controller.gender.text.trim(),controller.fullname.text.trim());
                        Navigator.pop(context);
                        },
                      child: Text("SAVE",style: TextStyle(
                        fontSize: 15,
                        letterSpacing: 2,
                        color: Colors.white
                      ),),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.blue,
                      padding: EdgeInsets.symmetric(horizontal: 50),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                    ),
                  )

                ],
              )

            ],
          ),
        ),
      ),
    );
  }

  Widget buildTextField(String labelText,TextEditingController controllers,String placeholder,bool isPasswordText,bool isPassword){
    return Padding(
        padding: EdgeInsets.only(bottom: 30),
      child: TextFormField(
        controller: controllers,
        // initialValue: placeholder,
        enabled: isPasswordText,
        obscureText: isPassword,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          contentPadding: EdgeInsets.only(bottom: 5),
          labelText: labelText,
          labelStyle: TextStyle(
            color: Colors.black,

          ),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          // hintText: placeholder,
          hintStyle: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.grey,
          )
        ),
      ),
    );
  }
}
