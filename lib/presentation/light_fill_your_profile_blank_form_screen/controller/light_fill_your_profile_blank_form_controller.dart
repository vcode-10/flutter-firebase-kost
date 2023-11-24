import 'package:projectkost/core/app_export.dart';
import 'package:projectkost/presentation/light_fill_your_profile_blank_form_screen/models/light_fill_your_profile_blank_form_model.dart';
import 'package:flutter/material.dart';

/// A controller class for the LightFillYourProfileBlankFormScreen.
///
/// This class manages the state of the LightFillYourProfileBlankFormScreen, including the
/// current lightFillYourProfileBlankFormModelObj
class LightFillYourProfileBlankFormController extends GetxController {
  TextEditingController fullNameController = TextEditingController();

  TextEditingController nameController = TextEditingController();

  TextEditingController dateOfBirthController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  TextEditingController phoneNumberController = TextEditingController();

  Rx<LightFillYourProfileBlankFormModel> lightFillYourProfileBlankFormModelObj =
      LightFillYourProfileBlankFormModel().obs;

  SelectionPopupModel? selectedDropDownValue;

  @override
  void onClose() {
    super.onClose();
    fullNameController.dispose();
    nameController.dispose();
    dateOfBirthController.dispose();
    emailController.dispose();
    phoneNumberController.dispose();
  }

  onSelected(dynamic value) {
    for (var element
        in lightFillYourProfileBlankFormModelObj.value.dropdownItemList.value) {
      element.isSelected = false;
      if (element.id == value.id) {
        element.isSelected = true;
      }
    }
    lightFillYourProfileBlankFormModelObj.value.dropdownItemList.refresh();
  }
}
