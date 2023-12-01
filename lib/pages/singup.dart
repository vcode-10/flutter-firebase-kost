import 'package:flutter/material.dart';
import 'package:projectkost/core/app_export.dart';
import 'package:projectkost/core/utils/validation_functions.dart';
import 'package:projectkost/pages/home_page.dart';
import 'package:projectkost/pages/signin.dart';
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
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _fullname = TextEditingController();
  final TextEditingController _name = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  bool isLoading = false;
  final DatabaseReference _databaseReference =
      FirebaseDatabase.instance.ref().child("users");

  @override
  void initState() {
    super.initState();
  }

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Form(
          key: _formKey,
          child: Container(
            width: double.maxFinite,
            padding: EdgeInsets.symmetric(horizontal: 24.h, vertical: 26.v),
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
                        builder: (context) => SignIn(
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
              Text("Daftar".tr, style: CustomTextStyles.headlineLargeGray90001),
              SizedBox(height: 28.v),
              CustomTextFormField(
                  controller: _fullname,
                  hintText: "Nama Panjang".tr,
                  hintStyle: theme.textTheme.bodyMedium!,
                  prefixConstraints: BoxConstraints(maxHeight: 60.v),
                  validator: (value) {
                    if (value == null) {
                      return "nama panjang tidak boleh kosong!".tr;
                    }
                    return null;
                  },
                  contentPadding:
                      EdgeInsets.only(top: 21.v, right: 30.h, bottom: 21.v),
                  borderDecoration: TextFormFieldStyleHelper.fillGray,
                  fillColor: appTheme.gray50),
              SizedBox(height: 20.v),
              CustomTextFormField(
                  controller: _name,
                  hintText: "Nama Panggilan".tr,
                  hintStyle: theme.textTheme.bodyMedium!,
                  prefixConstraints: BoxConstraints(maxHeight: 60.v),
                  validator: (value) {
                    if (value == null) {
                      return "nama panjang tidak boleh kosong!".tr;
                    }
                    return null;
                  },
                  contentPadding:
                      EdgeInsets.only(top: 21.v, right: 30.h, bottom: 21.v),
                  borderDecoration: TextFormFieldStyleHelper.fillGray,
                  fillColor: appTheme.gray50),
              SizedBox(height: 20.v),
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
                  suffix: InkWell(
                      onTap: () {
                        // controller.isShowPassword.value =
                        //     !controller.isShowPassword.value;
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
                text: "Daftar".tr,
                buttonStyle: CustomButtonStyles.fillBlue,
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    createUserWithEmailAndPassword();
                  }
                },
              ),
              SizedBox(height: 23.v)
            ]),
          ),
        ),
      ),
    );
  }

  createUserWithEmailAndPassword() async {
    try {
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: _email.text,
        password: _password.text,
      );

      if (userCredential.user!.uid != null) {
        Map<String, String> emailAndPassword = {
          'email': _email.text,
          'username': _fullname.text,
          'name': _name.text,
        };

        _databaseReference
            .child(userCredential.user!.uid)
            .set(emailAndPassword)
            .whenComplete(() {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (_) => const HomePage(),
            ),
          );
        });
      }

      // await _databaseReference.child(userCredential.user!.uid).set({});

      // _fullname.text = '';
      // _name.text = '';
      // _email.text = '';
      // _password.text = '';
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      } else {
        print('Error creating user. Please try again.');
      }
    }
  }
}
