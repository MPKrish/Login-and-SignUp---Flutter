import 'package:flutter/material.dart';
import 'package:flutter_application_1/colors.dart';
import 'package:flutter_application_1/constants.dart';
import 'package:flutter_application_1/signup_page.dart';

import 'home_screen.dart';
// import 'package:flutter_application_1/home_screen.dart';
// import "package:firebase_auth/firebase_auth.dart";

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  late String _email, _password;

  // Function to validate email
  String? emailValidator(String? email) {
    if (email == null || email.isEmpty) {
      return "Please Enter Email";
    }
    String pattern = r'\w+@\w+\.\w+'; // Simple regex for email validation
    RegExp regExp = RegExp(pattern);
    if (!regExp.hasMatch(email)) {
      return "Please Enter a Valid Email";
    }
    return null;
  }

  // Function to validate password
  String? passwordValidator(String? password) {
    if (password == null || password.isEmpty) {
      return "Please Enter Password";
    } else if (password.length < 6) {
      return "Password must be at least 6 characters long";
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: true,
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    Image.asset(
                      bgImage,
                      height: height * 0.30,
                      width: width,
                      fit: BoxFit.cover,
                    ),
                    Container(
                      height: height * 0.42,
                      width: width,
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          stops: [0.3, 0.7],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [Colors.transparent, Colors.white],
                        ),
                      ),
                    ),
                    const Positioned(
                      bottom: 20,
                      left: 0,
                      right: 0,
                      child: Center(
                        child: Column(
                          children: [
                            Text(
                              appName,
                              style: TextStyle(
                                  fontSize: 25, fontWeight: FontWeight.w700),
                            ),
                            Text(
                              slogan,
                              style: TextStyle(color: Colors.grey),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0, top: 20),
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          primaryColor.withOpacity(0.3),
                          Colors.transparent,
                        ],
                      ),
                      border: const Border(
                        left: BorderSide(color: primaryColor, width: 5),
                      ),
                    ),
                    child: const Text(
                      "  $loginString  ",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 22),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 10.0, vertical: 10.0),
                  child: TextFormField(
                    onSaved: (value) {
                      _email = value!;
                    },
                    validator: emailValidator,
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: primaryColor),
                      ),
                      prefixIcon: Icon(
                        Icons.email,
                        color: primaryColor,
                      ),
                      labelText: "EMAIL ADDRESS",
                      labelStyle: TextStyle(color: primaryColor, fontSize: 16),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 10.0, vertical: 10.0),
                  child: TextFormField(
                    onSaved: (value) {
                      _password = value!;
                    },
                    obscureText: true,
                    validator: passwordValidator,
                    decoration: const InputDecoration(
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: primaryColor),
                      ),
                      prefixIcon: Icon(
                        Icons.lock_open,
                        color: primaryColor,
                      ),
                      labelText: "PASSWORD",
                      labelStyle: TextStyle(color: primaryColor, fontSize: 16),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {},
                    child: const Text(
                      "Forgot Password ?",
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        formKey.currentState?.save();

                        if (_email == "test@gmail.com" &&
                            _password == "root@123") {
                          
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const HomeScreen(),
                            ),
                          );  
                        } else {
                          print("Invalid Login Details");
                        }
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(350, 50),
                      backgroundColor: primaryColor,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                    ),
                    child: const Text(
                      "Login to Account",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Don't have an account?"),
                    TextButton(
                      onPressed: () {Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const SignupPage(),
                            ),
                          );  },
                      child: const Text(
                        "Create Account",
                        style: TextStyle(color: primaryColor, fontSize: 16),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
