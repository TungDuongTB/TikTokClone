import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tiktok/Screen/home/pages/home/navigatrion_container.dart';
import 'package:tiktok/Screen/home/pages/profile/editProfile.dart';
import 'package:tiktok/controllers/login&signup/signup_controller.dart';
import 'package:tiktok/database/models/user.dart';
import 'package:tiktok/database/models/user_repository.dart';
import 'package:tiktok/main.dart';
class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}):super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late User _user;
  final UserRepository _userRepository = UserRepository();
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.white,
          actions: [
            Icon(Icons.info_outline),
          ],
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  "${_user.fullname}",
                  style: TextStyle(color: Colors.black),
                  textAlign: TextAlign.center,
                ),
              ),
              IconButton(
                  onPressed: (){
                    SignUpController.instance.loginOut();
                    // Navigator.push(context, MaterialPageRoute(builder: NavigatorScreen));
                  },
                  icon: Icon(
                    Icons.output,
                    color: Colors.black,
                  ),
              ),
            ],
          )
      ),
      body: SafeArea(
            child: Column(
              children: [
                Container(
                  child: Column(
                    children: [
                      SizedBox(height: 40),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ClipOval(
                            child: CachedNetworkImage(
                              imageUrl: '${_user.profileImageUrl}',
                              fit: BoxFit.contain,
                              height: 100,
                              width: 100,
                              placeholder: (context, url) => CircularProgressIndicator(),
                              errorWidget: (context, url, error) => Icon(Icons.error),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("10", style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w700)),
                              SizedBox(height: 10),
                              Text("Fllowers", style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w400)),
                            ],
                          ),
                          SizedBox(width: 10),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("10", style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w700)),
                              SizedBox(height: 10),
                              Text("Friends", style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w400)),
                            ],
                          ),
                          SizedBox(width: 10),
                        ],
                      ),
                      SizedBox(width: 5),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          OutlinedButton(
                              style: ButtonStyle(
                                padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                                  EdgeInsets.all(20.0), // Đặt giá trị padding là 10
                                ),
                              ),
                              onPressed: (){
                                Navigator.push(context, MaterialPageRoute(builder: gotoEdit));
                              },
                              child: Text(
                                  "Sửa hồ sơ",
                                  style: TextStyle(color: Colors.black)
                              ),
                          ),
                          SizedBox(width: 5),
                          OutlinedButton(
                              style: ButtonStyle(
                                padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                                  EdgeInsets.all(20.0), // Đặt giá trị padding là 10
                                ),
                              ),
                              onPressed: (){
                              },
                              child: Text(
                                  "Đổi mật khẩu",
                                  style: TextStyle(color: Colors.black)
                              ),
                          ),
                          SizedBox(width: 5),
                          OutlinedButton(
                            style: ButtonStyle(
                              padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                                EdgeInsets.all(20.0), // Đặt giá trị padding là 10
                              ),
                            ),
                            onPressed: (){
                            },
                            child: Text(
                                "Fllower",
                                style: TextStyle(color: Colors.black)
                            ),
                          ),

                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  height: 260,
                  child: Expanded(
                      child: TastBar()
                  ),
                )
              ],
            ),
      ),
    );
  }
  Widget TastBar(){
    final style = Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 18,fontWeight: FontWeight.w600);
    return DefaultTabController(
        initialIndex: 1,
        length: 2,
        child: Scaffold(
          // backgroundColor: Colors.black,

          body: Stack(
            fit: StackFit.passthrough,
            children: [
              TabBarView(
              children: [
                ListView(
                  children: [
                    Container(
                        padding: EdgeInsets.only(top: 55,left: 20,right: 20),
                        alignment: Alignment.topLeft,
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Padding(padding: EdgeInsets.only(top: 10,bottom: 10)),
                                Text(
                                  "Fullname:",
                                  style: style,
                                ),
                                SizedBox(width: 10),
                                Text(
                                  "${_user.fullname}",
                                  style: style,
                                )
                              ],
                            ),
                            Divider(
                              thickness: 1,
                              color: Colors.grey,
                            ),
                            SizedBox(height: 10),
                            Row(
                              children: [
                                Padding(padding: EdgeInsets.only(top: 10,bottom: 10)),
                                Text(
                                  "Email:",
                                  style: style,
                                ),
                                SizedBox(width: 10),
                                Text(
                                  "${_user.email}",
                                  style: style,
                                )
                              ],
                            ),
                            Divider(
                              thickness: 1,
                              color: Colors.grey,
                            ),
                            SizedBox(height: 10),
                            Row(
                              children: [
                                Padding(padding: EdgeInsets.only(top: 10,bottom: 10)),
                                Text(
                                  "Phone:",
                                  style: style,
                                ),
                                SizedBox(width: 10),
                                Text(
                                  "${_user.phoneNo}",
                                  style: style,
                                )
                              ],
                            ),
                            Divider(
                              thickness: 1,
                              color: Colors.grey,
                            ),
                            SizedBox(height: 10),
                            Row(
                              children: [
                                Padding(padding: EdgeInsets.only(top: 10,bottom: 10)),
                                Text(
                                  "Giới tính:",
                                  style: style,
                                ),
                                SizedBox(width: 10),
                                Text(
                                  "${_user.gender}",
                                  style: style,
                                )
                              ],
                            ),
                            Divider(
                              thickness: 1,
                              color: Colors.grey,
                            ),
                            SizedBox(height: 10),
                            Row(
                              children: [
                                Padding(padding: EdgeInsets.only(top: 10,bottom: 10)),
                                Text(
                                  "Tuổi:",
                                  style: style,
                                ),
                                SizedBox(width: 10),
                                Text(
                                  "${_user.age}",
                                  style: style,
                                )
                              ],
                            ),
                            Divider(
                              thickness: 1,
                              color: Colors.grey,
                            ),
                          ],
                        )
                    ),
                  ],
                ),
                Container(
                    padding: EdgeInsets.only(top: 50),
                    child: Column(
                      children: [
                        Text("data")
                      ],
                    )
                ),

              ]
              ),
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: TabBar(
                  tabs: [
                    Tab(
                      child: Icon(Icons.person,color: Colors.black,)
                    ),
                    Tab(
                      child: Icon(CupertinoIcons.play_rectangle_fill,color: Colors.black)
                    ),
                  ],
                  indicator: UnderlineTabIndicator(
                      borderSide: BorderSide(
                        width: 3,
                        color: Colors.white,
                      ),
                      insets: EdgeInsets.only(left: 70,right: 70)
                  ),
                ),
              ),
            ],
          ),
        )
    );
  }
  Widget gotoEdit(BuildContext context){
    return EditProfile();
  }
  Widget NavigatorScreen(BuildContext context){
    return MyApp();
  }
}