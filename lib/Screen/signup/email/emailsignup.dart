import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tiktok/Screen/home/pages/home/Home.dart';
import 'package:tiktok/controllers/login&signup/signup_controller.dart';

class EmailSignup extends StatefulWidget {
  const EmailSignup({super.key});

  @override
  State<EmailSignup> createState() => _EmailSignupState();
}

class _EmailSignupState extends State<EmailSignup> {
  final controller = Get.put(SignUpController());
  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
              children: <Widget>[
                Text(
                  'Sign up with email',
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
                    controller: controller.fullname,
                    obscureText: false,
                    decoration: InputDecoration(
                      labelText: "Full name: ",
                    ),

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
                SizedBox(
                  width: 500,
                  child: new TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: "Confim Password: ",
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
                        SignUpController.instance.registerUser(context,controller.email.text.trim(), controller.password.text.trim(),controller.fullname.text.trim());
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
  Widget gotoHome(BuildContext context){
    return HomeScreen();
  }
}
