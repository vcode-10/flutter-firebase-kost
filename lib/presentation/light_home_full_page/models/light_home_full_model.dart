import '../../../core/app_export.dart';
import 'realestatecard_item_model.dart';

/// This class defines the variables used in the [light_home_full_page],
/// and is typically used to hold data that is passed between different parts of the application.
class LightHomeFullModel {
  Rx<List<RealestatecardItemModel>> realestatecardItemList = Rx([
    RealestatecardItemModel(
        userImage: ImageConstant.imgRectangle.obs,
        realEstateName: "La Grand Maison".obs,
        cityCountry: "Tokyo, Japan".obs,
        price: "36".obs,
        priceUnit: "/ night".obs),
    RealestatecardItemModel(
        userImage: ImageConstant.imgRectangle154x154.obs,
        realEstateName: "Alpha Housing".obs,
        cityCountry: "Delhi, India".obs,
        price: "28".obs,
        priceUnit: "/ night".obs),
    RealestatecardItemModel(
        userImage: ImageConstant.imgRectangle1.obs,
        realEstateName: "Mill House".obs,
        cityCountry: "Shanghai, China".obs,
        price: "25".obs,
        priceUnit: "/ night".obs),
    RealestatecardItemModel(
        userImage: ImageConstant.imgRectangle2.obs,
        realEstateName: "Astute Homes".obs,
        cityCountry: "Sau Paulo, Brazil".obs,
        price: "32".obs,
        priceUnit: "/ night".obs),
    RealestatecardItemModel(
        userImage: ImageConstant.imgRectangle3.obs,
        realEstateName: "White Cottage".obs,
        cityCountry: "London, UK".obs,
        price: "30".obs,
        priceUnit: "/ night".obs),
    RealestatecardItemModel(
        userImage: ImageConstant.imgRectangle4.obs,
        realEstateName: "Carriage House".obs,
        cityCountry: "Osaka, Japan".obs,
        price: "27".obs,
        priceUnit: "/ night".obs),
    RealestatecardItemModel(
        userImage: ImageConstant.imgRectangle5.obs,
        realEstateName: "Meadow View".obs,
        cityCountry: "Washington, US".obs,
        price: "29".obs,
        priceUnit: "/ night".obs),
    RealestatecardItemModel(
        userImage: ImageConstant.imgRectangle6.obs,
        realEstateName: "Sweet Villa".obs,
        cityCountry: "London, UK".obs,
        price: "26".obs,
        priceUnit: "/ night".obs)
  ]);
}
