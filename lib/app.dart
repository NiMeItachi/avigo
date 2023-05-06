import 'package:avigo/pages/enter_page.dart';
import 'package:avigo/pages/login_page.dart';
import 'package:avigo/pages/registration_page.dart';
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
