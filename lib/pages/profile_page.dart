import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:projectkost/pages/auth_checker.dart';
import 'package:projectkost/core/app_export.dart';
import 'package:projectkost/core/utils/validation_functions.dart';
import 'package:projectkost/pages/home_profile.dart';
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
  final user = FirebaseAuth.instance.currentUser;
  final storageRef = FirebaseStorage.instance.ref();

  String? earthRefUrl;

  @override
  void initState() {
    super.initState();
    _fullNameController.text = '';
    _emailController.text = '';
    _nameController.text = '';
    _phoneNumberController.text = '';
    _dateOfBirthController.text = '';
    readData();
  }

  void readData() {
    DatabaseReference usersRef =
        FirebaseDatabase.instance.ref('users/${user?.uid}');

    usersRef.onValue.listen((DatabaseEvent event) {
      final data = event.snapshot.value;
      print(data);
      if (data != null && data is Map) {
        // Set the URL of the image
        setState(() {
          _fullNameController.text = data['fullname'] ?? '';
          _emailController.text = data['email'] ?? '';
          _nameController.text = data['name'] ?? '';
          _phoneNumberController.text = data['phoneNumber'] ?? '';
          _dateOfBirthController.text = data['dateOfBirth'] ?? '';
        });
      } else {
        print('No data found for the current user.');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return AuthChecker(
        child: Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: _buildAppBar(),
      body: Form(
        key: _formKey,
        child: Container(
          width: double.maxFinite,
          padding: EdgeInsets.symmetric(horizontal: 24.h, vertical: 20.v),
          child: Column(children: [
            SizedBox(
                height: 160.adaptSize,
                width: 160.adaptSize,
                child: Stack(alignment: Alignment.bottomRight, children: [
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
        ),
      ),
      bottomNavigationBar: _buildContinue(),
    ));
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar() {
    return CustomAppBar(
        leadingWidth: 52.h,
        leading: AppbarLeadingImage(
            imagePath: ImageConstant.imgArrowLeft,
            margin: EdgeInsets.only(left: 24.h, top: 14.v, bottom: 13.v),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const HomeProfile(),
                ),
              );
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
        margin: EdgeInsets.fromLTRB(16.h, 12.v, 12.h, 12.v), // Adjust margin
        child: CustomImageView(
          imagePath: ImageConstant.imgIconlyCurvedCalendar,
          height: 20.adaptSize,
          width: 20.adaptSize,
        ),
      ),
      suffixConstraints: BoxConstraints(maxHeight: 56.v),
      contentPadding: EdgeInsets.only(left: 20.h, top: 19.v, bottom: 19.v),
      borderDecoration: TextFormFieldStyleHelper.fillGray,
      fillColor: appTheme.gray50,
    );
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
        hintText: "Nomor Handphone".tr,
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
