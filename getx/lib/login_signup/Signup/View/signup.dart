import 'package:flutter/material.dart';
import 'package:getx/Component/TextField.dart';
import 'package:getx/login_signup/Signup/Controller/authController.dart';
import 'package:get/get.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  late TextEditingController emailController;
  late TextEditingController pwController;
  late TextEditingController confirmPwController;

  final FocusNode _idTextNode = FocusNode();
  final FocusNode _pwTextNode = FocusNode();
  final FocusNode _confirmPwTextNode = FocusNode();

  late bool seePassword;
  late bool seeConfirmPassword;

  late bool showEmailHelperText;
  late bool showPwHelperText;
  late bool showConfirmPwHelperText;

  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
    pwController = TextEditingController();
    confirmPwController = TextEditingController();

    seePassword = true;
    seeConfirmPassword = true;
    showEmailHelperText = true;
    showPwHelperText = true;
    showConfirmPwHelperText = true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('회원가입'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RawKeyboardListener(
              focusNode: _idTextNode,
              onKey: (event) {
                check(emailController.text.isEmpty, 'email');
              },
              child: MyTextfield(
                controller: emailController,
                hintText: '아이디',
                helperText: showEmailHelperText ? '아이디를 입력하세요.' : null,
                obscureText: false,
                autofocus: false,
                keyboardType: TextInputType.emailAddress,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            RawKeyboardListener(
              focusNode: _pwTextNode,
              onKey: (event) {
                check(pwController.text.isEmpty, 'password');
              },
              child: MyTextfield(
                controller: pwController,
                hintText: '패스워드',
                helperText: showPwHelperText ? '패스워드를 입력하세요.' : null,
                obscureText: false,
                autofocus: false,
                keyboardType: TextInputType.emailAddress,
                icon: IconButton(
                  onPressed: () {
                    setState(() {
                      seePassword == true
                          ? seePassword = false
                          : seePassword = true;
                    });
                  },
                  icon: const Icon(
                    Icons.remove_red_eye_rounded,
                  ),
                  color: seePassword == true ? Colors.grey : Colors.blue,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            RawKeyboardListener(
              focusNode: _confirmPwTextNode,
              onKey: (value) {
                check(confirmPwController.text.isEmpty, 'confirmPassword');
              },
              child: MyTextfield(
                controller: confirmPwController,
                hintText: '패스워드 확인',
                helperText: showEmailHelperText ? '패드워드 확인을 입력하세요.' : null,
                obscureText: false,
                autofocus: false,
                keyboardType: TextInputType.text,
                icon: IconButton(
                  onPressed: () {
                    setState(() {
                      seeConfirmPassword == true
                          ? seeConfirmPassword = false
                          : seeConfirmPassword = true;
                    });
                  },
                  icon: const Icon(
                    Icons.remove_red_eye_rounded,
                  ),
                  color: seeConfirmPassword == true ? Colors.grey : Colors.blue,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () {
                pwController.text.trim() == confirmPwController.text.trim()
                    ? AuthController.instance.register(
                        emailController.text.trim(),
                        pwController.text.trim(),
                      )
                    : Get.snackbar(
                        'error',
                        'error',
                        backgroundColor: Colors.red,
                        snackPosition: SnackPosition.BOTTOM,
                        titleText: const Text(
                          'error',
                          style: TextStyle(color: Colors.white),
                        ),
                        messageText: const Text(
                          '패스워드가 일치하지 않습니다.',
                          style: TextStyle(color: Colors.white),
                        ),
                      );
              },
              style: ButtonStyle(
                minimumSize: MaterialStateProperty.all(const Size(341, 50.0)),
              ),
              child: const Text(
                '회원가입',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  check(bool isEmpty, String result) {
    switch (result) {
      case 'email':
        setState(() {
          showEmailHelperText = isEmpty;
        });
        break;
      case 'password':
        setState(() {
          showPwHelperText = isEmpty;
        });
        break;
      case 'confirmPassword':
        setState(() {
          showConfirmPwHelperText = isEmpty;
        });
        break;
    }
  }
}
