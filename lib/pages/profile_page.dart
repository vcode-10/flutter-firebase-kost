import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:projectkost/pages/auth_checker.dart';
import 'package:projectkost/core/app_export.dart';
import 'package:projectkost/core/utils/validation_functions.dart';
import 'package:projectkost/pages/home_profile.dart';
import 'package:projectkost/widgets/app_bar/appbar_leading_image.dart';
import 'package:projectkost/widgets/app_bar/appbar_subtitle.dart';
import 'package:projectkost/widgets/app_bar/custom_app_bar.dart';
import 'package:projectkost/widgets/custom_elevated_button.dart';
import 'package:projectkost/widgets/custom_text_form_field.dart';
import 'package:date_field/date_field.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  DateTime? selectedDate;
  File? file;
  ImagePicker image = ImagePicker();
  var urlImageProfile;
  var urlImageProfileUpdate;
  final user = FirebaseAuth.instance.currentUser;
  final storageRef = FirebaseStorage.instance.ref();

  @override
  void initState() {
    super.initState();
    userData();
  }

  void userData() async {
    DataSnapshot snapshot =
        await FirebaseDatabase.instance.ref('users/${user?.uid}').get();

    Map dataUser = snapshot.value as Map;
    String dateOfBirthString = dataUser['dateofbirth'] ?? '';
    setState(() {
      _emailController.text = dataUser['email'] ?? '';
      _fullNameController.text = dataUser['username'] ?? '';
      _nameController.text = dataUser['name'] ?? '';
      _phoneNumberController.text = dataUser['phoneNumber'] ?? '';
      selectedDate = DateTime.parse(dateOfBirthString);
      urlImageProfile = dataUser['urlImageProfile'];
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
                      imagePath:
                          urlImageProfile ?? ImageConstant.imgEllipse160x160,
                      height: 160.adaptSize,
                      width: 160.adaptSize,
                      radius: BorderRadius.circular(80.h),
                      alignment: Alignment.center),
                  CustomImageView(
                      imagePath: ImageConstant.imgEdit,
                      height: 40.adaptSize,
                      width: 40.adaptSize,
                      onTap: () {
                        getImage();
                      },
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
    return DateTimeField(
      onDateSelected: (DateTime value) {
        setState(() {
          selectedDate = value;
        });
      },
      selectedDate: selectedDate,
      mode: DateTimeFieldPickerMode.date,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
      decoration: const InputDecoration(
        labelText: 'Tanggal Lahir',
      ),
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
        borderDecoration: TextFormFieldStyleHelper.fillGray,
        fillColor: appTheme.gray50);
  }

  /// Section Widget
  Widget _buildContinue() {
    return CustomElevatedButton(
        text: "Simpan".tr,
        margin: EdgeInsets.only(left: 24.h, right: 24.h, bottom: 48.v),
        onPressed: () {
          uploadData();
        },
        buttonStyle: CustomButtonStyles.fillBlue);
  }

  getImage() async {
    var img = await image.pickImage(source: ImageSource.gallery);
    setState(() {
      file = File(img!.path);
    });

    try {
      var imagefile = FirebaseStorage.instance
          .ref()
          .child("users_photo")
          .child("/${_emailController.text}.jpg");
      UploadTask task = imagefile.putFile(file!);
      TaskSnapshot snapshot = await task;
      urlImageProfileUpdate = await snapshot.ref.getDownloadURL();
      setState(() {
        urlImageProfileUpdate = urlImageProfileUpdate;
      });
      if (urlImageProfileUpdate != null) {
        Map<String, String> userArray = {
          'urlImageProfile': urlImageProfileUpdate,
        };
        FirebaseDatabase.instance
            .ref()
            .child('users/${user?.uid}')
            .update(userArray)
            .whenComplete(() {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (_) => const ProfilePage(),
            ),
          );
        });
      }
    } catch (e) {
      print(e);
    }
  }

  uploadData() async {
    try {
      Map<String, String> userArray = {
        'name': _nameController.text,
        'phoneNumber': _phoneNumberController.text,
        'dateofbirth': DateFormat('yyyy-MM-dd').format(selectedDate!),
      };

      FirebaseDatabase.instance
          .ref()
          .child('users/${user?.uid}')
          .update(userArray)
          .whenComplete(() {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (_) => const ProfilePage(),
          ),
        );
      });
    } catch (e) {
      print(e);
    }
  }
}
