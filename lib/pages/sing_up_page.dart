import 'dart:math';

import 'package:flutter/material.dart';
import 'package:projectkost/core/app_export.dart';
import 'package:projectkost/core/utils/validation_functions.dart';
import 'package:projectkost/pages/auth_page.dart';
import 'package:projectkost/pages/home_page.dart';
import 'package:projectkost/pages/login_page.dart';
import 'package:projectkost/widgets/custom_elevated_button.dart';
import 'package:projectkost/widgets/custom_text_form_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

class SignUp extends StatefulWidget {
  final void Function()? onPressed;
  const SignUp({super.key, required this.onPressed});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final ref = FirebaseDatabase.instance.ref();
  final _formKey = GlobalKey<FormState>();
  bool isLoading = false;
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final DatabaseReference _databaseReference =
      FirebaseDatabase.instance.reference().child("users");

  createUserWithEmailAndPassword() async {
    try {
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: _email.text,
        password: _password.text,
      );
      await _databaseReference.child(userCredential.user!.uid).set({
        "name": _email.text,
      });
      _email.text = '';
      _password.text = '';
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('The account already exists for that email.'),
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error creating user. Please try again.'),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            body: Form(
                key: _formKey,
                child: Container(
                    width: double.maxFinite,
                    padding:
                        EdgeInsets.symmetric(horizontal: 24.h, vertical: 26.v),
                    child: Column(children: [
                      CustomImageView(
                          imagePath: ImageConstant.imgArrowLeft,
                          height: 28.adaptSize,
                          width: 28.adaptSize,
                          alignment: Alignment.centerLeft,
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => LoginPage(
                                  onPressed: () {
                                    // Aksi yang dijalankan saat SignUp ditekan
                                    widget.onPressed;
                                  },
                                ),
                              ),
                            );
                          }),
                      SizedBox(height: 52.v),
                      CustomImageView(
                          imagePath: ImageConstant.imgVector101x96,
                          height: 101.v,
                          width: 96.h),
                      SizedBox(height: 44.v),
                      Text("Daftar".tr,
                          style: CustomTextStyles.headlineLargeGray90001),
                      SizedBox(height: 28.v),
                      CustomTextFormField(
                          controller: _email,
                          hintText: "Email".tr,
                          hintStyle: theme.textTheme.bodyMedium!,
                          textInputType: TextInputType.emailAddress,
                          prefix: Container(
                              margin:
                                  EdgeInsets.fromLTRB(20.h, 20.v, 12.h, 20.v),
                              child: CustomImageView(
                                  imagePath: ImageConstant.imgIconlyBoldMessage,
                                  height: 20.adaptSize,
                                  width: 20.adaptSize)),
                          prefixConstraints: BoxConstraints(maxHeight: 60.v),
                          validator: (value) {
                            if (value == null ||
                                (!isValidEmail(value, isRequired: true))) {
                              return "email tidak valid!".tr;
                            }
                            return null;
                          },
                          contentPadding: EdgeInsets.only(
                              top: 21.v, right: 30.h, bottom: 21.v),
                          borderDecoration: TextFormFieldStyleHelper.fillGray,
                          fillColor: appTheme.gray50),
                      SizedBox(height: 20.v),
                      CustomTextFormField(
                          controller: _password,
                          hintText: "Password".tr,
                          hintStyle: theme.textTheme.bodyMedium!,
                          textInputAction: TextInputAction.done,
                          textInputType: TextInputType.visiblePassword,
                          prefix: Container(
                              margin:
                                  EdgeInsets.fromLTRB(20.h, 20.v, 12.h, 20.v),
                              child: CustomImageView(
                                  imagePath: ImageConstant.imgBag,
                                  height: 20.adaptSize,
                                  width: 20.adaptSize)),
                          prefixConstraints: BoxConstraints(maxHeight: 60.v),
                          suffix: InkWell(
                              onTap: () {
                                // controller.isShowPassword.value =
                                //     !controller.isShowPassword.value;
                              },
                              child: Container(
                                  margin: EdgeInsets.fromLTRB(
                                      30.h, 20.v, 20.h, 20.v),
                                  child: CustomImageView(
                                      imagePath: ImageConstant.imgSettings,
                                      height: 20.adaptSize,
                                      width: 20.adaptSize))),
                          suffixConstraints: BoxConstraints(maxHeight: 60.v),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Password tidak Boleh Kosong".tr;
                            }
                            return null;
                          },
                          // obscureText: controller.isShowPassword.value,
                          contentPadding: EdgeInsets.symmetric(vertical: 21.v),
                          borderDecoration: TextFormFieldStyleHelper.fillGray,
                          fillColor: appTheme.gray50),
                      SizedBox(height: 20.v),
                      CustomElevatedButton(
                        text: "Daftar".tr,
                        buttonStyle: CustomButtonStyles.fillBlue,
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            createUserWithEmailAndPassword();
                          }
                        },
                      ),
                      SizedBox(height: 23.v)
                    ])))));
  }
}
