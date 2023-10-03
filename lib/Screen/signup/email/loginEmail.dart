import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tiktok/controllers/login&signup/signup_controller.dart';
class LoginEmail extends StatefulWidget {
  const LoginEmail({super.key});

  @override
  State<LoginEmail> createState() => _LoginEmailState();
}

class _LoginEmailState extends State<LoginEmail> {
  final controller = Get.put(SignUpController());
  final _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: InkWell(
            child: Icon(
              Icons.arrow_back_rounded,
              color: Colors.black,
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),


          backgroundColor: Colors.white,
        ),
        body: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.all(15),
          child: Form(
            key: _formkey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Login with email',
                  style: GoogleFonts.roboto(
                      textStyle: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      )
                  ),
                ),
                Padding(padding: EdgeInsets.only(top: 20)),

                SizedBox(
                  width: 500,
                  child: new TextField(
                    controller: controller.email,
                    obscureText: false,
                    decoration: InputDecoration(
                      labelText: "Email: ",
                    ),

                  ),
                ),
                Padding(padding: EdgeInsets.only(top: 20)),

                SizedBox(
                  width: 500,
                  child: new TextField(
                    controller: controller.password,
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: "Password: ",
                    ),

                  ),
                ),
                Padding(padding: EdgeInsets.only(top: 20)),
                OutlinedButton(

                    style: ButtonStyle(
                      padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                        EdgeInsets.all(20.0), // Đặt giá trị padding là 10
                      ),
                      minimumSize: MaterialStateProperty.all<Size>(
                        Size(300, 40), // Đặt kích thước theo chiều rộng và chiều cao mong muốn
                      ),
                      backgroundColor: MaterialStateProperty.all<Color>(
                        Colors.cyanAccent, // Màu nền mong muốn
                      ),
                    ),
                    onPressed: (){
                      if(_formkey.currentState!.validate()){
                        SignUpController.instance.loginUser(context,controller.email.text.trim(), controller.password.text.trim());
                      }
                    },
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(width: 10,),
                        Text(
                          "Confirm",
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                      ],
                    )
                ),
              ],
            ),
          ),

        ),
      ),
    );
  }
}
