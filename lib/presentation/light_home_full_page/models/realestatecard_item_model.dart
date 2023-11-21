import '../../../core/app_export.dart';

/// This class is used in the [realestatecard_item_widget] screen.
class RealestatecardItemModel {
  RealestatecardItemModel({
    this.userImage,
    this.realEstateName,
    this.cityCountry,
    this.price,
    this.priceUnit,
    this.id,
  }) {
    userImage = userImage ?? Rx(ImageConstant.imgRectangle);
    realEstateName = realEstateName ?? Rx("La Grand Maison");
    cityCountry = cityCountry ?? Rx("Tokyo, Japan");
    price = price ?? Rx("36");
    priceUnit = priceUnit ?? Rx("/ night");
    id = id ?? Rx("");
  }

  Rx<String>? userImage;

  Rx<String>? realEstateName;

  Rx<String>? cityCountry;

  Rx<String>? price;

  Rx<String>? priceUnit;

  Rx<String>? id;
}
