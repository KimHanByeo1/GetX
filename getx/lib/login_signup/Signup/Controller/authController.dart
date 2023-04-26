import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/login_signup/login/View/login.dart';
import 'package:getx/main/View/mypage.dart';

class AuthController extends GetxController {
  static AuthController instance = Get.find();
  late Rx<User?> _user;
  FirebaseAuth authentication = FirebaseAuth.instance;

  @override
  void onReady() {
    super.onReady();
    _user = Rx<User?>(authentication.currentUser);
    _user.bindStream(authentication.userChanges());
    ever(_user, _moveToPage);
  }

  _moveToPage(User? user) {
    if (user == null) {
      Get.offAll(() => const LoginPage());
    } else {
      Get.offAll(() => MyPage());
    }
  }

  register(String email, password) async {
    var errorMessage;
    try {
      await authentication.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    } catch (e) {
      if (e.toString() ==
          '[firebase_auth/email-already-in-use] The email address is already in use by another account.') {
        // 이메일이 중복 되었을 경우
        errorMessage = '중복된 이메일입니다.';
      } else if (e.toString() ==
          '[firebase_auth/invalid-email] The email address is badly formatted.') {
        // 이메일 형식에 맞지 않을 경우
        errorMessage = '이메일 형식에 맞춰 작성해주세요.';
      } else if (e.toString() ==
          '[firebase_auth/weak-password] Password should be at least 6 characters') {
        // 비밀번호가 6자 이하인 경우
        errorMessage = '6자 이상의 비밀번호를 작성해주세요.';
      }
      Get.snackbar(
        'error',
        errorMessage,
        backgroundColor: Colors.red,
        snackPosition: SnackPosition.BOTTOM,
        titleText: const Text(
          'error',
          style: TextStyle(color: Colors.white),
        ),
        messageText: Text(
          errorMessage,
          style: const TextStyle(color: Colors.white),
        ),
      );
    }
  }

  logout() {
    authentication.signOut();
  }
}
