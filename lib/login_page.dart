import 'package:avigo/enter_page.dart';
import 'package:avigo/registration_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LogInPage extends StatefulWidget {
  static const String id = "login_page";

  const LogInPage({Key? key}) : super(key: key);

  @override
  State<LogInPage> createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
  bool _obscureText = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            //Back
            Container(
              margin: const EdgeInsets.only(top: 20),
              width: MediaQuery.of(context).size.width,
              height: 50,
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
                      "Log In",
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
            ),
            //Welcome Text
            Container(
              margin: const EdgeInsets.only(top: 20),
              width: MediaQuery.of(context).size.width,
              height: 50,
              child: const Padding(
                padding: EdgeInsets.only(left: 15),
                child: Text(
                  "Welcome back!\nPlease log in to continue!",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                ),
              ),
            ),
            //Input
            Container(
              margin: const EdgeInsets.only(top: 40, left: 15, right: 15),
              width: MediaQuery.of(context).size.width,
              height: 150,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
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
                  Align(
                    alignment: Alignment.centerRight,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, RegistrationPage.id);
                      },
                      child: const Text("Forgot password?"),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(
              height: 30,
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
                  "LOG IN",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
