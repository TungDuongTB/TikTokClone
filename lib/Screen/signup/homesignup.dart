import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tiktok/Screen/signup/email/emailsignup.dart';

class HomeSignup extends StatelessWidget {
  const HomeSignup({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.only(left: 15,right: 15),
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
                'Sign up to Top Top ',
                style: GoogleFonts.roboto(
                  textStyle: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w800,

                  ),

                )
            ),
            Padding(padding: EdgeInsets.only(top: 20)),

            Text(
              ' Tạo hồ sơ, theo dõi các tài khoản khác,\n quay video của chính bạn v.v',
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
                      "Đăng ký bằng số điện thoại",
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
                  Navigator.push(context, MaterialPageRoute(builder: gotoEmailSignup));

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
                      "Đăng ký bằng email",
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ],
                )
            ),

            Padding(padding: EdgeInsets.only(top: 20)),
            TextButton(onPressed: (){
              Navigator.pop(context);
            }, child: Text(
              "Bạn đã có tài khoản ? Login. ",
              style: TextStyle(color: CupertinoColors.activeBlue),
            ))
          ],
        ),
      ),
    );
  }
  Widget gotoEmailSignup(BuildContext context){
    return EmailSignup();
  }
  Widget gotoHomeSignup(BuildContext context){
    return HomeSignup();
  }
}
