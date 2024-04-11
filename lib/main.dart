import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ig_database/views/screens/Home_Page.dart';
import 'package:ig_database/views/screens/Loggin_Page.dart';
import 'package:ig_database/views/screens/sign_up_page.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true),
      routes: {
        '/': (context) => login_page(),
        'home_page': (context) => Home_Page(),
        'Sign_up_Page': (context) => Sign_up_page(),
      },
    );
  }
}
