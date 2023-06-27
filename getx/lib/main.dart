import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/firebase_options.dart';
import 'package:getx/login_signup/Signup/Controller/authController.dart';
import 'package:getx/login_signup/login/View/login.dart';

// void main() {
//   runApp(const MyApp());
// }

void main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    // name: 'getx',
    options: DefaultFirebaseOptions.currentPlatform,
  ).then(
    (value) => Get.put(AuthController()),
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: darkMode,
      themeMode: ThemeMode.system,
      debugShowCheckedModeBanner: false,
      // home: MyPage(),
      home: const LoginPage(),
    );
  }

  final ThemeData darkMode = ThemeData(
    brightness: Brightness.dark,
  );
}
