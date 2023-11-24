import '../controller/light_fill_your_profile_blank_form_controller.dart';
import 'package:get/get.dart';

/// A binding class for the LightFillYourProfileBlankFormScreen.
///
/// This class ensures that the LightFillYourProfileBlankFormController is created when the
/// LightFillYourProfileBlankFormScreen is first loaded.
class LightFillYourProfileBlankFormBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LightFillYourProfileBlankFormController());
  }
}
