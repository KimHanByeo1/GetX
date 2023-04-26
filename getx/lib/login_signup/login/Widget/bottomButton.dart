import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/login_signup/Signup/View/signup.dart';

class LoginBottomButton extends StatelessWidget {
  const LoginBottomButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextButton(
          onPressed: () {
            //
          },
          child: const Text(
            style: TextStyle(color: Colors.black),
            'ID 찾기',
          ),
        ),
        const Text(' | '),
        TextButton(
          onPressed: () {
            //
          },
          child: const Text(
            style: TextStyle(color: Colors.black),
            'PW 찾기',
          ),
        ),
        const Text(' | '),
        TextButton(
          onPressed: () {
            Get.to(const SignUp());
          },
          child: const Text(
            style: TextStyle(color: Colors.black),
            '회원가입',
          ),
        ),
      ],
    );
  }
}
