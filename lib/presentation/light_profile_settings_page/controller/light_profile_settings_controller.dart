import 'package:projectkost/core/app_export.dart';
import 'package:projectkost/presentation/light_profile_settings_page/models/light_profile_settings_model.dart';

/// A controller class for the LightProfileSettingsPage.
///
/// This class manages the state of the LightProfileSettingsPage, including the
/// current lightProfileSettingsModelObj
class LightProfileSettingsController extends GetxController {
  LightProfileSettingsController(this.lightProfileSettingsModelObj);

  Rx<LightProfileSettingsModel> lightProfileSettingsModelObj;

  Rx<bool> isSelectedSwitch = false.obs;
}
