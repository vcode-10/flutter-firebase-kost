import '../controller/light_search_results_list_controller.dart';
import '../models/luckylakeapartments_item_model.dart';
import 'package:flutter/material.dart';
import 'package:projectkost/core/app_export.dart';
import 'package:projectkost/widgets/custom_elevated_button.dart';

// ignore: must_be_immutable
class LuckylakeapartmentsItemWidget extends StatelessWidget {
  LuckylakeapartmentsItemWidget(
    this.luckylakeapartmentsItemModelObj, {
    Key? key,
  }) : super(
          key: key,
        );

  LuckylakeapartmentsItemModel luckylakeapartmentsItemModelObj;

  var controller = Get.find<LightSearchResultsListController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(14.h),
      decoration: AppDecoration.outlineOnErrorContainer.copyWith(
        borderRadius: BorderRadiusStyle.circleBorder28,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 120.adaptSize,
            width: 120.adaptSize,
            child: Stack(
              alignment: Alignment.topRight,
              children: [
                Obx(
                  () => CustomImageView(
                    imagePath: luckylakeapartmentsItemModelObj.userImage!.value,
                    height: 120.adaptSize,
                    width: 120.adaptSize,
                    radius: BorderRadius.circular(
                      20.h,
                    ),
                    alignment: Alignment.center,
                  ),
                ),
                CustomElevatedButton(
                  height: 22.v,
                  width: 46.h,
                  text: "lbl_4_8".tr,
                  margin: EdgeInsets.only(
                    top: 12.v,
                    right: 12.h,
                  ),
                  leftIcon: Container(
                    margin: EdgeInsets.only(right: 4.h),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        5.h,
                      ),
                    ),
                    child: CustomImageView(
                      imagePath: ImageConstant.imgIconlyBoldStar10x10,
                      height: 10.adaptSize,
                      width: 10.adaptSize,
                    ),
                  ),
                  buttonTextStyle: theme.textTheme.labelLarge!,
                  alignment: Alignment.topRight,
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 16.h,
              top: 19.v,
              bottom: 19.v,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 110.h,
                  child: Obx(
                    () => Text(
                      luckylakeapartmentsItemModelObj.realEstateName!.value,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: CustomTextStyles.titleLargeGray90001.copyWith(
                        height: 1.20,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10.v),
                Obx(
                  () => Text(
                    luckylakeapartmentsItemModelObj.cityCountry!.value,
                    style: CustomTextStyles.bodyMediumGray700,
                  ),
                ),
              ],
            ),
          ),
          Spacer(),
          Padding(
            padding: EdgeInsets.only(
              top: 14.v,
              right: 4.h,
              bottom: 14.v,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                CustomImageView(
                  imagePath: ImageConstant.imgIconlyLightOutlineHeart,
                  height: 20.adaptSize,
                  width: 20.adaptSize,
                ),
                SizedBox(height: 24.v),
                Obx(
                  () => Text(
                    luckylakeapartmentsItemModelObj.price!.value,
                    style: CustomTextStyles.headlineSmallPrimary,
                  ),
                ),
                SizedBox(height: 5.v),
                Obx(
                  () => Text(
                    luckylakeapartmentsItemModelObj.night!.value,
                    style: theme.textTheme.bodySmall,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
