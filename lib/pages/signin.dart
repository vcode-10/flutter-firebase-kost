import 'package:flutter/material.dart';
import 'package:projectkost/core/app_export.dart';
import 'package:projectkost/core/utils/validation_functions.dart';
import 'package:projectkost/pages/auth_page.dart';
import 'package:projectkost/pages/home_page.dart';
import 'package:projectkost/pages/singup.dart';
import 'package:projectkost/widgets/custom_elevated_button.dart';
import 'package:projectkost/widgets/custom_text_form_field.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignIn extends StatefulWidget {
  final void Function()? onPressed;
  const SignIn({super.key, required this.onPressed});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final TextEditingController _password = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool isLoading = false;

  bool isShowPassword = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Form(
        key: _formKey,
        child: Container(
          width: double.maxFinite,
          padding: EdgeInsets.symmetric(horizontal: 24.h, vertical: 26.v),
          child: Column(children: [
            SizedBox(height: 52.v),
            CustomImageView(
                imagePath: ImageConstant.imgVector101x96,
                height: 101.v,
                width: 96.h),
            SizedBox(height: 44.v),
            Text("LOGIN".tr, style: CustomTextStyles.headlineLargeGray90001),
            SizedBox(height: 28.v),
            CustomTextFormField(
                controller: _email,
                hintText: "Email".tr,
                hintStyle: theme.textTheme.bodyMedium!,
                textInputType: TextInputType.emailAddress,
                prefix: Container(
                    margin: EdgeInsets.fromLTRB(20.h, 20.v, 12.h, 20.v),
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
                contentPadding:
                    EdgeInsets.only(top: 21.v, right: 30.h, bottom: 21.v),
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
                    margin: EdgeInsets.fromLTRB(20.h, 20.v, 12.h, 20.v),
                    child: CustomImageView(
                        imagePath: ImageConstant.imgBag,
                        height: 20.adaptSize,
                        width: 20.adaptSize)),
                prefixConstraints: BoxConstraints(maxHeight: 60.v),
                obscureText: !isShowPassword,
                suffix: InkWell(
                    onTap: () {
                      setState(() {
                        isShowPassword = !isShowPassword;
                      });
                    },
                    child: Container(
                        margin: EdgeInsets.fromLTRB(30.h, 20.v, 20.h, 20.v),
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
              text: "Sign In".tr,
              buttonStyle: CustomButtonStyles.fillBlue,
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  signInWithEmailAndPassword();
                }
              },
            ),
            SizedBox(height: 23.v),
            Text("Lupa Password!".tr,
                style: CustomTextStyles.titleMediumPrimarySemiBold),
            SizedBox(height: 31.v),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Padding(
                  padding: EdgeInsets.only(bottom: 1.v),
                  child: Text("Belum punya akun?".tr,
                      style: theme.textTheme.bodyMedium)),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SignUp(
                          onPressed: () {
                            widget.onPressed;
                          },
                        ),
                      ),
                    );
                  },
                  child: Text(
                    "daftar".tr,
                    style: CustomTextStyles.titleSmallPrimary,
                  ),
                ),
              )
            ]),
            SizedBox(height: 5.v)
          ]),
        ),
      ),
    );
  }

  signInWithEmailAndPassword() async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(
              email: _email.text, password: _password.text)
          .whenComplete(() => Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const HomePage()),
              ));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user..');
      }
    }
  }
}
