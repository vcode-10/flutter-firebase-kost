import '../../../core/app_export.dart';import 'luckylakeapartments_item_model.dart';/// This class defines the variables used in the [light_search_results_list_screen],
/// and is typically used to hold data that is passed between different parts of the application.
class LightSearchResultsListModel {Rx<List<LuckylakeapartmentsItemModel>> luckylakeapartmentsItemList = Rx([LuckylakeapartmentsItemModel(userImage:ImageConstant.imgRectangle120x120.obs,realEstateName: "Lucky Lake Apartments".obs,cityCountry: "Beijing, China".obs,price: "32".obs,night: "/ night".obs),LuckylakeapartmentsItemModel(userImage:ImageConstant.imgRectangle8.obs,realEstateName: "Home Away From Home".obs,cityCountry: "New Delhi, India".obs,price: "29".obs,night: "/ night".obs),LuckylakeapartmentsItemModel(userImage:ImageConstant.imgRectangle10.obs,realEstateName: "Tropicana Del Norte".obs,cityCountry: "Tokyo, Japan".obs,price: "27".obs,night: "/ night".obs)]);

 }
