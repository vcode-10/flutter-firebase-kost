import '../../../core/app_export.dart';

/// This class is used in the [luckylakeapartments_item_widget] screen.
class LuckylakeapartmentsItemModel {
  LuckylakeapartmentsItemModel({
    this.userImage,
    this.realEstateName,
    this.cityCountry,
    this.price,
    this.night,
    this.id,
  }) {
    userImage = userImage ?? Rx(ImageConstant.imgRectangle120x120);
    realEstateName = realEstateName ?? Rx("Lucky Lake Apartments");
    cityCountry = cityCountry ?? Rx("Beijing, China");
    price = price ?? Rx("32");
    night = night ?? Rx("/ night");
    id = id ?? Rx("");
  }

  Rx<String>? userImage;

  Rx<String>? realEstateName;

  Rx<String>? cityCountry;

  Rx<String>? price;

  Rx<String>? night;

  Rx<String>? id;
}
