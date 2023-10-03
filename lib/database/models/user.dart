import 'package:cloud_firestore/cloud_firestore.dart';

class User{
  final String fullname;
  final String id;
  final String profileImageUrl;
  final String email;
  final String phoneNo;
  final String password;
  final String gender;
  final String age;
  // final List<String>? following;
  // final List<String>? follower;


  const User(
      this.id,
      this.fullname,
      this.profileImageUrl,
      this.email,
      this.phoneNo,
      this.password,
      this.gender,
      this.age,
      );

  toJson(){
    return{
      "ID":id,
      "Fullname":fullname,
      "Email":email,
      "Phone":phoneNo,
      "Password":password,
      "Gender":gender,
      "Age":age,
      "ProfileImageUrl":profileImageUrl,
    };
  }

}