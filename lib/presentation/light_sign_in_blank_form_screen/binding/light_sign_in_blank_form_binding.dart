import '../controller/light_sign_in_blank_form_controller.dart';
import 'package:get/get.dart';

/// A binding class for the LightSignInBlankFormScreen.
///
/// This class ensures that the LightSignInBlankFormController is created when the
/// LightSignInBlankFormScreen is first loaded.
class LightSignInBlankFormBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LightSignInBlankFormController());
  }
}
