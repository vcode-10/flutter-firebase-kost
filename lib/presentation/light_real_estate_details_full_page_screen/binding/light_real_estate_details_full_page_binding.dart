import '../controller/light_real_estate_details_full_page_controller.dart';
import 'package:get/get.dart';

/// A binding class for the LightRealEstateDetailsFullPageScreen.
///
/// This class ensures that the LightRealEstateDetailsFullPageController is created when the
/// LightRealEstateDetailsFullPageScreen is first loaded.
class LightRealEstateDetailsFullPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LightRealEstateDetailsFullPageController());
  }
}
