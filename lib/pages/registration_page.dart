import 'package:avigo/pages/enter_page.dart';
import 'package:avigo/pages/login_page.dart';
import 'package:avigo/services/auth_service.dart';
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

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final dateController = TextEditingController();
  final passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  void registration(){
    String name = nameController.text.trim();
    String email = emailController.text.trim();
    String date = dateController.text.trim();
    String password = passwordController.text.trim();

    debugPrint("$name, $email, $date, $password");

    bool successfully = AuthService.signUp(name, email, date, password);
    if(successfully){
      Navigator.pushReplacementNamed(context, LogInPage.id);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: Colors.green,
          content: Text('User is successfully registered'),
          duration: Duration(seconds: 2),
          shape: StadiumBorder(),
          dismissDirection: DismissDirection.horizontal,
          showCloseIcon: true,
          closeIconColor: Colors.white,
        ),
      );
    }
    else {
      debugPrint("User has already exist");
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: Colors.yellow,
          content: Text('User has already have'),
          duration: Duration(seconds: 2),
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
                height: 324,
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Full name
                      TextFormField(
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
                        controller: nameController,
                        textInputAction: TextInputAction.next,
                        validator: (name) {
                          if(name!.length < 3){
                            return "Length must be 4 characters or more";
                          } else {
                            return null;
                          }
                        },
                      ),
                      // Email address
                      TextFormField(
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
                      // Date of Birth
                      TextFormField(
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
                        controller: dateController,
                        style: const TextStyle(),
                        textInputAction: TextInputAction.next,
                        validator: (date){
                          if(date!.length < 8 && int.tryParse(date) != null){
                            return "Invalid date";
                          } else {
                            return null;
                          }
                        },
                      ),
                      // Password
                      TextFormField(
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.grey.shade300,
                          prefixIcon: const Icon(
                            Icons.lock,
                            color: Colors.grey,
                          ),
                          suffixIcon: GestureDetector(
                            onTap: (){
                              _obscureText = !_obscureText;
                              setState(() {});
                            },
                            child: Icon(
                              _obscureText ? CupertinoIcons.eye_fill : CupertinoIcons.eye_slash_fill,
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
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 40),
              //Log In
              GestureDetector(
                onTap: (){
                  bool validate = false;
                  // email validate
                  if (_formKey.currentState!.validate()) validate = true;

                  if(validate){
                    registration();
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        backgroundColor: Colors.red,
                        content: Text('Invalid data, please try again'),
                        duration: Duration(seconds: 2),
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
                      "LET'S GET STARTED",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 30),
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
