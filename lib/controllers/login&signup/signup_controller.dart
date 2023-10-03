
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:tiktok/controllers/login&signup/authentication_repository.dart';

class SignUpController extends GetxController{
  static SignUpController get instance => Get.find();
  final email = TextEditingController();
  final password = TextEditingController();
  final fullname = TextEditingController();
  final phone = TextEditingController();
  final age = TextEditingController();
  final gender = TextEditingController();
  final profileImageUrl = TextEditingController();

  void registerUser(BuildContext context, String email,String password,String fullname){
      AuthenticationRepository.instance.createUserWithEmailAndPassword(context,email, password,fullname);
  }
  void loginUser(BuildContext context,String email,String password){
    AuthenticationRepository.instance.loginWithEmailAndPassword(context,email, password);
  }
  void loginOut(){
    AuthenticationRepository.instance.logOut();
  }
  void editUser(BuildContext context,String email,String phone,String age,String gender,String fullname){
    AuthenticationRepository.instance.editUserById(context, email, fullname, phone, age, gender);
  }
}