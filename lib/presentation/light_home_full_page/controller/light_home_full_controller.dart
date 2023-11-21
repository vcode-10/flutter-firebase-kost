import 'package:projectkost/core/app_export.dart';
import 'package:projectkost/presentation/light_home_full_page/models/light_home_full_model.dart';

/// A controller class for the LightHomeFullPage.
///
/// This class manages the state of the LightHomeFullPage, including the
/// current lightHomeFullModelObj
class LightHomeFullController extends GetxController {
  LightHomeFullController(this.lightHomeFullModelObj);

  Rx<LightHomeFullModel> lightHomeFullModelObj;
}
