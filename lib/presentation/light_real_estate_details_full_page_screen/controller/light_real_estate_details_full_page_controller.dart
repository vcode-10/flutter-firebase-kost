import 'package:projectkost/core/app_export.dart';
import 'package:projectkost/presentation/light_real_estate_details_full_page_screen/models/light_real_estate_details_full_page_model.dart';

/// A controller class for the LightRealEstateDetailsFullPageScreen.
///
/// This class manages the state of the LightRealEstateDetailsFullPageScreen, including the
/// current lightRealEstateDetailsFullPageModelObj
class LightRealEstateDetailsFullPageController extends GetxController {
  Rx<LightRealEstateDetailsFullPageModel>
      lightRealEstateDetailsFullPageModelObj =
      LightRealEstateDetailsFullPageModel().obs;
}
