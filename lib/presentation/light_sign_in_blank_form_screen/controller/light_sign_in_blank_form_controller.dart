import 'package:projectkost/core/app_export.dart';
import 'package:projectkost/presentation/light_sign_in_blank_form_screen/models/light_sign_in_blank_form_model.dart';
import 'package:flutter/material.dart';

/// A controller class for the LightSignInBlankFormScreen.
///
/// This class manages the state of the LightSignInBlankFormScreen, including the
/// current lightSignInBlankFormModelObj
class LightSignInBlankFormController extends GetxController {
  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  Rx<LightSignInBlankFormModel> lightSignInBlankFormModelObj =
      LightSignInBlankFormModel().obs;

  Rx<bool> isShowPassword = true.obs;

  Rx<bool> englishLabel = false.obs;

  @override
  void onClose() {
    super.onClose();
    emailController.dispose();
    passwordController.dispose();
  }
}
