import 'package:flutter/material.dart';

class SignUpWithEmailAndPasswordFailure{
  final String message;
  const SignUpWithEmailAndPasswordFailure([this.message="Lỗi"]);
  factory SignUpWithEmailAndPasswordFailure.code(String code){
    switch(code){
      case 'weak-password':
        return const SignUpWithEmailAndPasswordFailure('Vui lòng diền mật khẩu');
      case 'invalid-email':
        return const SignUpWithEmailAndPasswordFailure('Email không hợp lệ');
      case 'email-already-in-use':
        return const SignUpWithEmailAndPasswordFailure('Email đã tồn tại');
      case 'operation-not-allowed':
        return const SignUpWithEmailAndPasswordFailure('Nhập lại');
      case 'user-disabled':
        return const SignUpWithEmailAndPasswordFailure('Nhập lại');
      default:
        return const SignUpWithEmailAndPasswordFailure();
    }
  }
}