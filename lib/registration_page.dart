import 'package:avigo/enter_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class RegistrationPage extends StatefulWidget {
  static const String id = "registration_page";

  const RegistrationPage({Key? key}) : super(key: key);

  @override
  State<RegistrationPage> createState() => _RegistrationPage();
}

class _RegistrationPage extends State<RegistrationPage> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              //Back
              Container(
                margin: const EdgeInsets.only(top: 20),
                width: MediaQuery.of(context).size.width,
                height: 30,
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pushReplacementNamed(context, EnterPage.id);
                        },
                        child: const Icon(
                          Icons.arrow_back,
                          color: Colors.grey,
                          size: 30,
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 30),
                      child: Text(
                        "Create Account",
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                ),
              ),
              //Welcome Text
              Container(
                margin: const EdgeInsets.only(top: 30),
                width: MediaQuery.of(context).size.width,
                height: 50,
                child: const Padding(
                  padding: EdgeInsets.only(left: 15),
                  child: Text(
                    "Sign up to keep exploring amazing\ndestinations around the world!",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                  ),
                ),
              ),
              //Input
              Container(
                margin: const EdgeInsets.only(top: 30, left: 15, right: 15),
                width: MediaQuery.of(context).size.width,
                height: 260,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Full name
                    TextField(
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.grey.shade300,
                        prefixIcon: const Icon(
                          Icons.person,
                          color: Colors.grey,
                        ),
                        border: InputBorder.none,
                        labelText: "Full Name",
                        labelStyle: const TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                      style: const TextStyle(),
                      autofocus: true,
                    ),
                    // Email address
                    TextField(
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.grey.shade300,
                        prefixIcon: const Icon(
                          Icons.mail,
                          color: Colors.grey,
                        ),
                        border: InputBorder.none,
                        labelText: "Email Address",
                        labelStyle: const TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                      style: const TextStyle(),
                      autofocus: true,
                    ),
                    // Date of Birth
                    TextField(
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.grey.shade300,
                        prefixIcon: const Icon(
                          Icons.calendar_month,
                          color: Colors.grey,
                        ),
                        border: InputBorder.none,
                        labelText: "Date of Birth",
                        labelStyle: const TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        FilteringTextInputFormatter(RegExp(r'\d'),
                            allow: true),
                        LengthLimitingTextInputFormatter(8),
                      ],
                      style: const TextStyle(),
                      autofocus: true,
                    ),
                    // Password
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      height: 60,
                      child: Row(
                        children: [
                          const Expanded(
                            flex: 1,
                            child: Icon(
                              CupertinoIcons.padlock_solid,
                              color: Colors.grey,
                            ),
                          ),
                          Expanded(
                            flex: 6,
                            child: TextField(
                              decoration: const InputDecoration(
                                labelText: "Password",
                                labelStyle: TextStyle(color: Colors.grey),
                                border: InputBorder.none,
                              ),
                              obscureText: _obscureText,
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: GestureDetector(
                              onTap: () {
                                _obscureText = !_obscureText;
                                setState(() {

                                });
                              },
                              child: Icon(
                                _obscureText ? CupertinoIcons.eye : CupertinoIcons.eye_slash,
                                color: Colors.grey,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(
                height: 40,
              ),
              //Log In
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 15),
                width: MediaQuery.of(context).size.width,
                height: 60,
                decoration: BoxDecoration(
                  color: const Color.fromRGBO(57, 0, 220, 100),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Align(
                  alignment: Alignment.center,
                  child: Text(
                    "LET'S GET STARTED",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ),

              const SizedBox(
                height: 30,
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
      ),
    );
  }
}
