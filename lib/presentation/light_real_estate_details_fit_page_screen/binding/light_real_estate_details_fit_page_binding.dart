import '../controller/light_real_estate_details_fit_page_controller.dart';
import 'package:get/get.dart';

/// A binding class for the LightRealEstateDetailsFitPageScreen.
///
/// This class ensures that the LightRealEstateDetailsFitPageController is created when the
/// LightRealEstateDetailsFitPageScreen is first loaded.
class LightRealEstateDetailsFitPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LightRealEstateDetailsFitPageController());
  }
}
