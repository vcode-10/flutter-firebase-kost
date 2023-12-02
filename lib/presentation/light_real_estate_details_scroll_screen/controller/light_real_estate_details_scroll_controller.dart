import 'package:projectkost/core/app_export.dart';
import 'package:projectkost/presentation/light_real_estate_details_scroll_screen/models/light_real_estate_details_scroll_model.dart';

/// A controller class for the LightRealEstateDetailsScrollScreen.
///
/// This class manages the state of the LightRealEstateDetailsScrollScreen, including the
/// current lightRealEstateDetailsScrollModelObj
class LightRealEstateDetailsScrollController extends GetxController {
  Rx<LightRealEstateDetailsScrollModel> lightRealEstateDetailsScrollModelObj =
      LightRealEstateDetailsScrollModel().obs;
}
