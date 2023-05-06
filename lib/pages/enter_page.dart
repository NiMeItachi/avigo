import 'package:avigo/pages/registration_page.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'login_page.dart';

class EnterPage extends StatelessWidget {
  static const String id = "enter_page";

  const EnterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: SafeArea(

        child: Column(
          children: [
            const SizedBox(
              height: 80,
            ),
            //Logo
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 50),
              width: MediaQuery.of(context).size.width,
              height: 200,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image.asset(
                    "assets/images/logo.png",
                    width: 120,
                    height: 120,
                  ),
                  const Text(
                    'Avigo',
                    style: TextStyle(fontSize: 50, fontWeight: FontWeight.w900),
                  ),
                ],
              ),
            ),

            const SizedBox(
              height: 20,
            ),
            //Text
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 100),
              width: MediaQuery.of(context).size.width,
              height: 100,
              child: const Text(
                'Search less\ntravel more!',
                style: TextStyle(fontSize: 35, fontWeight: FontWeight.w700),
              ),
            ),

            const SizedBox(
              height: 20,
            ),
            //Lil Text
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 50),
              width: MediaQuery.of(context).size.width,
              height: 40,
              child: const Text(
                ' Great experiences at backpacker prices.',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
              ),
            ),

            const SizedBox(
              height: 50,
            ),
            //Buttons: Create an Account &  Log in
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              width: MediaQuery.of(context).size.width,
              height: 140,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, RegistrationPage.id);
                    },
                    child: Container(
                      height: 60,
                      decoration: BoxDecoration(
                        color: const Color.fromRGBO(57, 0, 220, 100),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Align(
                        alignment: Alignment.center,
                        child: Text(
                          "CREATE AN ACCOUNT",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, LogInPage.id);
                    },
                    child: Container(
                      height: 60,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border:
                            Border.all(width: 1, color: Colors.grey.shade300),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Align(
                        alignment: Alignment.center,
                        child: Text(
                          "LOG IN",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(
              height: 40,
            ),
            //Privacy policy
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              width: MediaQuery.of(context).size.width,
              height: 70,
              child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w300,
                    color: Colors.grey,
                  ),
                  children: [
                    const TextSpan(
                        text: "By creating an account, you agree to our\n"),
                    TextSpan(
                        text: "Terms & Conditions",
                        style: const TextStyle(
                          color: Color.fromRGBO(57, 0, 220, 100),
                          decoration: TextDecoration.underline,
                          decorationStyle: TextDecorationStyle.solid,
                          decorationColor: Color.fromRGBO(57, 0, 220, 100),
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            debugPrint("tapped");
                          }),
                    const TextSpan(text: " and agree to "),
                    TextSpan(
                        text: "Privacy Policy",
                        style: const TextStyle(
                          color: Color.fromRGBO(57, 0, 220, 100),
                          decoration: TextDecoration.underline,
                          decorationStyle: TextDecorationStyle.solid,
                          decorationColor: Color.fromRGBO(57, 0, 220, 100),
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            debugPrint("tapped");
                          }),
                    const TextSpan(text: "."),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
