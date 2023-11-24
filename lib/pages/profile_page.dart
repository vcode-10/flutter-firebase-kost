import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:projectkost/pages/auth_checker.dart';
import 'package:projectkost/core/app_export.dart';
import 'package:projectkost/core/utils/validation_functions.dart';
import 'package:projectkost/widgets/app_bar/appbar_leading_image.dart';
import 'package:projectkost/widgets/app_bar/appbar_subtitle.dart';
import 'package:projectkost/widgets/app_bar/custom_app_bar.dart';
import 'package:projectkost/widgets/custom_drop_down.dart';
import 'package:projectkost/widgets/custom_elevated_button.dart';
import 'package:projectkost/widgets/custom_text_form_field.dart';
import 'package:projectkost/presentation/light_fill_your_profile_blank_form_screen/controller/light_fill_your_profile_blank_form_controller.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _dateOfBirthController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    final DatabaseReference _userRef =
        FirebaseDatabase.instance.ref('users/${user!.uid}');
    Stream<DataSnapshot> userStream =
        _userRef.onValue.map((event) => event.snapshot);

    return AuthChecker(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: _buildAppBar(),
        body: Form(
          key: _formKey,
          child: StreamBuilder<DataSnapshot>(
            stream: userStream,
            builder: (context, AsyncSnapshot<DataSnapshot> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const CircularProgressIndicator();
              } else if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } else if (!snapshot.hasData) {
                return const Center(child: Text('No user data found'));
              } else {
                final userData = snapshot.data!.value;
                if (userData is Map<String, dynamic>?) {
                  String fullName = userData['fullName'] as String? ?? '';
                  String name = userData['name'] as String? ?? '';
                  String dateOfBirth = userData['dateOfBirth'] as String? ?? '';
                  String email = userData['email'] as String? ?? '';
                  String phoneNumber = userData['phoneNumber'] as String? ?? '';

                  setState(() {
                    _fullNameController.text = fullName;
                    _nameController.text = name;
                    _dateOfBirthController.text = dateOfBirth;
                    _emailController.text = email;
                    _phoneNumberController.text = phoneNumber;
                  });
                }

                return Container(
                  width: double.maxFinite,
                  padding:
                      EdgeInsets.symmetric(horizontal: 24.h, vertical: 20.v),
                  child: Column(children: [
                    SizedBox(
                        height: 160.adaptSize,
                        width: 160.adaptSize,
                        child:
                            Stack(alignment: Alignment.bottomRight, children: [
                          CustomImageView(
                              imagePath: ImageConstant.imgEllipse160x160,
                              height: 160.adaptSize,
                              width: 160.adaptSize,
                              radius: BorderRadius.circular(80.h),
                              alignment: Alignment.center),
                          CustomImageView(
                              imagePath: ImageConstant.imgEdit,
                              height: 40.adaptSize,
                              width: 40.adaptSize,
                              alignment: Alignment.bottomRight)
                        ])),
                    SizedBox(height: 24.v),
                    _buildFullName(),
                    SizedBox(height: 24.v),
                    _buildName(),
                    SizedBox(height: 24.v),
                    _buildDateOfBirth(),
                    SizedBox(height: 24.v),
                    _buildEmail(),
                    SizedBox(height: 24.v),
                    _buildPhoneNumber(),
                    SizedBox(height: 5.v)
                  ]),
                );
              }
            },
          ),
        ),
        bottomNavigationBar: _buildContinue(),
      ),
    );
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar() {
    return CustomAppBar(
        leadingWidth: 52.h,
        leading: AppbarLeadingImage(
            imagePath: ImageConstant.imgArrowLeft,
            margin: EdgeInsets.only(left: 24.h, top: 14.v, bottom: 13.v),
            onTap: () {
              onTapArrowLeft();
            }),
        title: AppbarSubtitle(
            text: "Profile Saya".tr, margin: EdgeInsets.only(left: 16.h)));
  }

  /// Section Widget
  Widget _buildFullName() {
    return CustomTextFormField(
        controller: _fullNameController,
        hintText: "Nama Lengkap".tr,
        hintStyle: theme.textTheme.bodyMedium!,
        validator: (value) {
          if (!isText(value)) {
            return "err_msg_please_enter_valid_text".tr;
          }
          return null;
        },
        borderDecoration: TextFormFieldStyleHelper.fillGray,
        fillColor: appTheme.gray50);
  }

  /// Section Widget
  Widget _buildName() {
    return CustomTextFormField(
        controller: _nameController,
        hintText: "Nama Panggilan".tr,
        hintStyle: theme.textTheme.bodyMedium!,
        validator: (value) {
          if (!isText(value)) {
            return "err_msg_please_enter_valid_text".tr;
          }
          return null;
        },
        borderDecoration: TextFormFieldStyleHelper.fillGray,
        fillColor: appTheme.gray50);
  }

  /// Section Widget
  Widget _buildDateOfBirth() {
    return CustomTextFormField(
        controller: _dateOfBirthController,
        hintText: "Tanggal Lahir".tr,
        hintStyle: theme.textTheme.bodyMedium!,
        suffix: Container(
            margin: EdgeInsets.fromLTRB(30.h, 18.v, 20.h, 18.v),
            child: CustomImageView(
                imagePath: ImageConstant.imgIconlyCurvedCalendar,
                height: 20.adaptSize,
                width: 20.adaptSize)),
        suffixConstraints: BoxConstraints(maxHeight: 56.v),
        contentPadding: EdgeInsets.only(left: 20.h, top: 19.v, bottom: 19.v),
        borderDecoration: TextFormFieldStyleHelper.fillGray,
        fillColor: appTheme.gray50);
  }

  /// Section Widget
  Widget _buildEmail() {
    return CustomTextFormField(
        controller: _emailController,
        hintText: "Email".tr,
        hintStyle: theme.textTheme.bodyMedium!,
        textInputType: TextInputType.emailAddress,
        suffix: Container(
            margin: EdgeInsets.fromLTRB(30.h, 18.v, 20.h, 18.v),
            child: CustomImageView(
                imagePath: ImageConstant.imgIconlyCurvedMessage,
                height: 20.adaptSize,
                width: 20.adaptSize)),
        suffixConstraints: BoxConstraints(maxHeight: 56.v),
        validator: (value) {
          if (value == null || (!isValidEmail(value, isRequired: true))) {
            return "err_msg_please_enter_valid_email".tr;
          }
          return null;
        },
        contentPadding: EdgeInsets.only(left: 20.h, top: 19.v, bottom: 19.v),
        borderDecoration: TextFormFieldStyleHelper.fillGray,
        fillColor: appTheme.gray50);
  }

  /// Section Widget
  Widget _buildPhoneNumber() {
    return CustomTextFormField(
        controller: _phoneNumberController,
        hintText: "Whatsapp".tr,
        hintStyle: theme.textTheme.bodyMedium!,
        textInputAction: TextInputAction.done,
        prefix: Padding(
            padding: EdgeInsets.fromLTRB(20.h, 19.v, 30.h, 19.v),
            child: Row(mainAxisSize: MainAxisSize.min, children: [
              CustomImageView(
                  imagePath: ImageConstant.imageNotFound,
                  height: 18.v,
                  width: 24.h,
                  margin: EdgeInsets.fromLTRB(20.h, 19.v, 30.h, 19.v)),
              CustomImageView(
                  imagePath: ImageConstant.imageNotFound,
                  height: 16.adaptSize,
                  width: 16.adaptSize)
            ])),
        prefixConstraints: BoxConstraints(maxHeight: 56.v),
        contentPadding: EdgeInsets.only(top: 19.v, right: 30.h, bottom: 19.v),
        borderDecoration: TextFormFieldStyleHelper.fillGray,
        fillColor: appTheme.gray50);
  }

  /// Section Widget
  Widget _buildContinue() {
    return CustomElevatedButton(
        text: "Simpan".tr,
        margin: EdgeInsets.only(left: 24.h, right: 24.h, bottom: 48.v),
        buttonStyle: CustomButtonStyles.fillBlue);
  }

  /// Navigates to the previous screen.
  onTapArrowLeft() {
    Get.back();
  }
}
