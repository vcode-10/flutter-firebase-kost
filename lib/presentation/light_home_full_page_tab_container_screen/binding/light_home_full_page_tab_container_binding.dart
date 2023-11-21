import '../controller/light_home_full_page_tab_container_controller.dart';
import 'package:get/get.dart';

/// A binding class for the LightHomeFullPageTabContainerScreen.
///
/// This class ensures that the LightHomeFullPageTabContainerController is created when the
/// LightHomeFullPageTabContainerScreen is first loaded.
class LightHomeFullPageTabContainerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LightHomeFullPageTabContainerController());
  }
}
