import 'package:flutter/material.dart';
import 'package:projectkost/pages/signin.dart';
import 'package:projectkost/pages/singup.dart';

class LoginAndSignUp extends StatefulWidget {
  const LoginAndSignUp({super.key});

  @override
  State<LoginAndSignUp> createState() => _LoginAndSignUpState();
}

class _LoginAndSignUpState extends State<LoginAndSignUp> {
  bool isLogin = true;

  void tooglePage() {
    setState(() {
      isLogin = !isLogin;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (isLogin) {
      return SignIn(
        onPressed: tooglePage,
      );
    } else {
      return SignUp(
        onPressed: tooglePage,
      );
    }
  }
}
