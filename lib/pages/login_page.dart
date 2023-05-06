import 'package:avigo/database/users_database.dart';
import 'package:avigo/pages/enter_page.dart';
import 'package:avigo/pages/registration_page.dart';
import 'package:avigo/services/auth_service.dart';
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

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final _formKeyEmail = GlobalKey<FormState>();
  final _formKeyPassword = GlobalKey<FormState>();

  signIn() {
    String email = emailController.text.trim();
    String password = passwordController.text.trim();

    bool successfully = AuthService.signIn(email, password);
    if (successfully) {
      debugPrint("You're successfully logged in");
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: Colors.green,
          content: Text("You're successfully logged in"),
          duration: Duration(seconds: 5),
          shape: StadiumBorder(),
          dismissDirection: DismissDirection.horizontal,
          showCloseIcon: true,
          closeIconColor: Colors.white,
        ),
      );
    }
    else {
      debugPrint("User is not found");
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: Colors.red,
          content: Text("User is not found"),
          duration: Duration(seconds: 5),
          shape: StadiumBorder(),
          dismissDirection: DismissDirection.horizontal,
          showCloseIcon: true,
          closeIconColor: Colors.white,
        ),
      );

    }
  }

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
              height: 178,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Email address
                  Form(
                    key: _formKeyEmail,
                    child: TextFormField(
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
                      autofillHints: const [AutofillHints.email],
                      controller: emailController,
                      textInputAction: TextInputAction.next,
                      validator: (email) {
                      RegExp emailRegExp = RegExp(
                          r'^([a-zA-Z\d._%+-]+)@([a-zA-Z\d.-]+\.[a-zA-Z]{2,})$');
                      if (emailRegExp.hasMatch(email!)) {
                        return null;
                      } else {
                        return "Email address is not valid";
                      }
                    },
                    ),
                  ),
                  // Password
                  Form(
                    key: _formKeyPassword,
                    child: TextFormField(
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.grey.shade300,
                        prefixIcon: const Icon(
                          Icons.lock,
                          color: Colors.grey,
                        ),
                        suffixIcon: GestureDetector(
                          onTap: () {
                            _obscureText = !_obscureText;
                            setState(() {});
                          },
                          child: Icon(
                            _obscureText
                                ? CupertinoIcons.eye_fill
                                : CupertinoIcons.eye_slash_fill,
                            color: Colors.grey,
                          ),
                        ),
                        border: InputBorder.none,
                        labelText: "Password",
                        labelStyle: const TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                      obscureText: _obscureText,
                      controller: passwordController,
                      style: const TextStyle(),
                      textInputAction: TextInputAction.done,
                      validator: (password){
                        if (password!.length >= 4){
                          return null;
                        } else {
                          return "Password must be 4 characters or more";
                        }
                      },
                    ),
                  ),
                  // Forgot password
                  Align(
                    alignment: Alignment.centerRight,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pushReplacementNamed(context, RegistrationPage.id);
                      },
                      child: const Text("Forgot password?"),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),
            //Log In
            GestureDetector(
              onTap: () {
                bool validateEmail = false;
                bool validatePassword = false;
                // email validate
                if (_formKeyEmail.currentState!.validate()) validateEmail = true;

                // password validate
                if (_formKeyPassword.currentState!.validate()) validatePassword = true;

                if(validateEmail && validatePassword){
                  signIn();
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      backgroundColor: Colors.red,
                      content: Text("Invalid data, please try again"),
                      duration: Duration(seconds: 5),
                      shape: StadiumBorder(),
                      dismissDirection: DismissDirection.horizontal,
                      showCloseIcon: true,
                      closeIconColor: Colors.white,
                    ),
                  );
                }
              },
              child: Container(
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
            ),
          ],
        ),
      ),
    );
  }
}
