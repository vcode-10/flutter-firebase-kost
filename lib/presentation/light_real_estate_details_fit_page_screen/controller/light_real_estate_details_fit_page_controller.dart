import 'package:projectkost/core/app_export.dart';
import 'package:projectkost/presentation/light_real_estate_details_fit_page_screen/models/light_real_estate_details_fit_page_model.dart';

/// A controller class for the LightRealEstateDetailsFitPageScreen.
///
/// This class manages the state of the LightRealEstateDetailsFitPageScreen, including the
/// current lightRealEstateDetailsFitPageModelObj
class LightRealEstateDetailsFitPageController extends GetxController {
  Rx<LightRealEstateDetailsFitPageModel> lightRealEstateDetailsFitPageModelObj =
      LightRealEstateDetailsFitPageModel().obs;
}
