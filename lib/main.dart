import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tiktok/Screen/home/pages/home/navigatrion_container.dart';
import 'package:tiktok/Screen/home/pages/profile/editProfile.dart';
import 'package:tiktok/Screen/home/pages/profile/profile_page.dart';
import 'package:tiktok/Screen/signup/email/emailsignup.dart';
import 'package:tiktok/Screen/signup/email/loginEmail.dart';
import 'package:tiktok/Screen/signup/homesignup.dart';
import 'package:tiktok/controllers/login&signup/authentication_repository.dart';
import 'package:tiktok/firebase_options.dart';
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  ).then((value) => Get.put(AuthenticationRepository()));
  runApp(MaterialApp(
    home: MyApp(),
    theme: ThemeData(
      textTheme: GoogleFonts.varelaRoundTextTheme(),
    ),
    debugShowCheckedModeBanner: false,
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          margin: const EdgeInsets.only(left: 15,right: 15),
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                  'Login to Top Top',
                  style: GoogleFonts.roboto(
                    textStyle: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w800,

                    ),

                  )
              ),
              Padding(padding: EdgeInsets.only(top: 20)),

              Text(
                ' Manage your account, check notifieations,\n comment on vides and more',
                textAlign: TextAlign.center,
                style: TextStyle(color: CupertinoColors.inactiveGray),
              ),

              Padding(padding: EdgeInsets.only(top: 15)),

              OutlinedButton(

                  style: ButtonStyle(
                    padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                      EdgeInsets.all(20.0), // Đặt giá trị padding là 10
                    ),
                    minimumSize: MaterialStateProperty.all<Size>(
                      Size(300, 40), // Đặt kích thước theo chiều rộng và chiều cao mong muốn
                    ),
                  ),
                  onPressed: (){
                  },
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                          CupertinoIcons.phone,
                        color: Colors.black,
                      ),
                      SizedBox(width: 10,),
                      Text(
                          "Đăng nhập bằng số điện thoại",
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    ],
                  )
              ),

              Padding(padding: EdgeInsets.only(top: 15),),
              OutlinedButton(

                  style: ButtonStyle(
                    padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                      EdgeInsets.all(20.0), // Đặt giá trị padding là 10
                    ),
                    minimumSize: MaterialStateProperty.all<Size>(
                      Size(300, 40), // Đặt kích thước theo chiều rộng và chiều cao mong muốn
                    ),
                  ),
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: gotoEmailLogin));

                  },
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.email,
                        color: Colors.black,
                      ),
                      SizedBox(width: 10,),
                      Text(
                        "Đăng nhập bằng email",
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    ],
                  )
              ),

              Padding(padding: EdgeInsets.only(top: 20)),
              TextButton(onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: gotoHomeSignup));
              }, child: Text(
                "Bạn chưa có tài khoản ? Sign up. ",
                style: TextStyle(color: CupertinoColors.activeBlue),
              ))
            ],
          ),
        ),
      ),

    );
  }
  Widget gotoHomeSignup(BuildContext context){
    return HomeSignup();
  }
  Widget gotoEmailLogin(BuildContext context){
    return LoginEmail();
  }
}
