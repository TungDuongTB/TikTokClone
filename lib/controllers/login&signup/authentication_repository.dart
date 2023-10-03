import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tiktok/Screen/home/pages/home/Home.dart';
import 'package:tiktok/Screen/home/pages/home/navigatrion_container.dart';
import 'package:tiktok/controllers/login&signup/SignUpWithEmailAndPasswordFailure.dart';
import 'package:tiktok/database/models/mock.dart';
import 'package:tiktok/main.dart';
import 'package:uuid/uuid.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  final _auth = FirebaseAuth.instance;
  late final Rx<User?> firebaseUser;

  @override
  void onReady() {
    firebaseUser = Rx<User?>(_auth.currentUser);
    firebaseUser.bindStream(_auth.userChanges());
    ever(firebaseUser, _setInitialScreen);
  }

  _setInitialScreen(User? user) {
    user == null ? Get.offAll(() => const MyApp()) : Get
        .offAll(() => const HomeScreen());
  }

  Future<void> createUserWithEmailAndPassword(BuildContext context,
      String email, String password, String fullname) async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      if (_auth.currentUser != null) {
        await _addUserDataToFirestore(curentUser.id, email, fullname, password);
        Navigator.push(
            context, MaterialPageRoute(builder: (_) => const MyApp()));
      } else {
        Navigator.push(
            context, MaterialPageRoute(builder: (_) => const HomeScreen()));
      }
    } on FirebaseAuthException catch (e) {
      final ex = SignUpWithEmailAndPasswordFailure.code(e.code);
    } catch (_) {
      const ex = SignUpWithEmailAndPasswordFailure();
    }
  }

  Future<void> loginWithEmailAndPassword(BuildContext context, String email,
      String password) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      final currentUser = _auth.currentUser;
      if (currentUser != null) {
        await prefs.setString('email', currentUser.email.toString());
        Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const NavigationContainer()));
      } else {
        Navigator.push(
            context, MaterialPageRoute(builder: (_) => const MyApp()));
      }
    } on FirebaseAuthException catch (e) {

    } catch (_) {}
  }

  Future<void> logOut() async => await _auth.signOut();

  Future<void> _addUserDataToFirestore(String userId, String email,
      String fullname, String password) async {
    try {
      final uuID = Uuid();
      final String id = uuID.v4();
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString("id", id);
      final userCollection = FirebaseFirestore.instance.collection('users');
      final userData = {
        "id":id,
        "Fullname": fullname,
        "Email": email,
        "Phone": "null",
        "Password": password,
        "Gender": "null",
        "Age": "null",
        "ProfileImageUrl": "https://static2.yan.vn/YanNews/2167221/202102/facebook-cap-nhat-avatar-doi-voi-tai-khoan-khong-su-dung-anh-dai-dien-e4abd14d.jpg"
      };
      await userCollection.add(userData);
    } catch (e) {
    }
  }

  Future<void> editUserById(BuildContext context,String email, String fullname,String phone,String age,String gender) async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      final userRef = FirebaseFirestore.instance.collection('users').doc(prefs.getString('id'));
      final userData = {
        "Fullname": fullname,
        "Email": email,
        "Phone": phone,
        "Gender": gender,
        "Age": age,
        "ProfileImageUrl": "https://cdn.pixabay.com/photo/2023/09/25/20/45/hummingbird-8275997_1280.jpg"
      };
      await userRef.set(userData);
      Navigator.pop(context);
    } catch (e) {
    }
  }
}

