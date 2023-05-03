import 'package:avigo/enter_page.dart';
import 'package:avigo/login_page.dart';
import 'package:avigo/registration_page.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const EnterPage(),
      routes: {
        EnterPage.id: (context) => const EnterPage(),
        LogInPage.id: (context) => const LogInPage(),
        RegistrationPage.id: (context) => const RegistrationPage(),
      },
    );
  }
}
