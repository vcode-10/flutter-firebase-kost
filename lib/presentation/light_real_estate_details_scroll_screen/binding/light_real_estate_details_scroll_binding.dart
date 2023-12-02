import '../controller/light_real_estate_details_scroll_controller.dart';
import 'package:get/get.dart';

/// A binding class for the LightRealEstateDetailsScrollScreen.
///
/// This class ensures that the LightRealEstateDetailsScrollController is created when the
/// LightRealEstateDetailsScrollScreen is first loaded.
class LightRealEstateDetailsScrollBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LightRealEstateDetailsScrollController());
  }
}
