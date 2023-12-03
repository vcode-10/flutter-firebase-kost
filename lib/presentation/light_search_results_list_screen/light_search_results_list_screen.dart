import '../light_search_results_list_screen/widgets/luckylakeapartments_item_widget.dart';
import 'controller/light_search_results_list_controller.dart';
import 'models/luckylakeapartments_item_model.dart';
import 'package:flutter/material.dart';
import 'package:projectkost/core/app_export.dart';
import 'package:projectkost/widgets/app_bar/appbar_leading_image.dart';
import 'package:projectkost/widgets/app_bar/appbar_title_edittext_one.dart';
import 'package:projectkost/widgets/app_bar/custom_app_bar.dart';

class LightSearchResultsListScreen
    extends GetWidget<LightSearchResultsListController> {
  const LightSearchResultsListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
      child: Scaffold(
        appBar: _buildAppBar(),
        body: SizedBox(
          width: mediaQueryData.size.width,
          child: SingleChildScrollView(
            padding: EdgeInsets.only(top: 24.v),
            child: Padding(
              padding: EdgeInsets.only(left: 24.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildAll(),
                  SizedBox(height: 23.v),
                  _buildAutoLayoutHorizontal(),
                  SizedBox(height: 24.v),
                  _buildLuckyLakeApartments()
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar() {
    return CustomAppBar(
        leadingWidth: 52.h,
        leading: AppbarLeadingImage(
            imagePath: ImageConstant.imgArrowLeft,
            margin: EdgeInsets.only(left: 24.h, top: 14.v, bottom: 14.v),
            onTap: () {
              onTapArrowLeft();
            }),
        title: AppbarTitleEdittextOne(
            margin: EdgeInsets.only(left: 16.h),
            hintText: "lbl_homes".tr,
            controller: controller.stateFilledSearchController));
  }

  /// Section Widget
  Widget _buildAll() {
    return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: IntrinsicWidth(
            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Container(
              width: 80.h,
              padding: EdgeInsets.symmetric(horizontal: 20.h, vertical: 8.v),
              decoration: AppDecoration.fillPrimary1
                  .copyWith(borderRadius: BorderRadiusStyle.roundedBorder20),
              child: Text("lbl_all".tr,
                  style: CustomTextStyles.titleMediumSemiBold_1)),
          Container(
              width: 106.h,
              margin: EdgeInsets.only(left: 12.h),
              padding: EdgeInsets.symmetric(horizontal: 20.h, vertical: 8.v),
              decoration: AppDecoration.outlinePrimary
                  .copyWith(borderRadius: BorderRadiusStyle.roundedBorder20),
              child: Text("lbl_house".tr,
                  style: CustomTextStyles.titleMediumPrimarySemiBold)),
          Container(
              width: 93.h,
              margin: EdgeInsets.only(left: 12.h),
              padding: EdgeInsets.symmetric(horizontal: 20.h, vertical: 8.v),
              decoration: AppDecoration.outlinePrimary
                  .copyWith(borderRadius: BorderRadiusStyle.roundedBorder20),
              child: Text("lbl_villa".tr,
                  style: CustomTextStyles.titleMediumPrimarySemiBold)),
          Container(
              width: 89.h,
              margin: EdgeInsets.only(left: 12.h),
              padding: EdgeInsets.symmetric(vertical: 8.v),
              decoration: AppDecoration.outlinePrimary
                  .copyWith(borderRadius: BorderRadiusStyle.roundedBorder20),
              child: Text("lbl_apartment".tr,
                  style: CustomTextStyles.titleMediumPrimarySemiBold)),
          Spacer(),
          Container(
              width: 90.h,
              padding: EdgeInsets.symmetric(horizontal: 20.h, vertical: 8.v),
              decoration: AppDecoration.outlinePrimary
                  .copyWith(borderRadius: BorderRadiusStyle.roundedBorder20),
              child: Text("lbl_others".tr,
                  style: CustomTextStyles.titleMediumPrimarySemiBold))
        ])));
  }

  /// Section Widget
  Widget _buildAutoLayoutHorizontal() {
    return Padding(
        padding: EdgeInsets.only(right: 24.h),
        child: Row(children: [
          Text("lbl_866_founds".tr,
              style: CustomTextStyles.titleLargeGray90001),
          Spacer(),
          CustomImageView(
              imagePath: ImageConstant.imgClosePrimary,
              height: 20.adaptSize,
              width: 20.adaptSize,
              margin: EdgeInsets.only(top: 2.v)),
          CustomImageView(
              imagePath: ImageConstant.imgSettingsGray500,
              height: 20.adaptSize,
              width: 20.adaptSize,
              margin: EdgeInsets.only(left: 12.h, top: 2.v))
        ]));
  }

  /// Section Widget
  Widget _buildLuckyLakeApartments() {
    return Padding(
        padding: EdgeInsets.only(right: 24.h),
        child: Obx(() => ListView.separated(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            separatorBuilder: (context, index) {
              return SizedBox(height: 20.v);
            },
            itemCount: controller.lightSearchResultsListModelObj.value
                .luckylakeapartmentsItemList.value.length,
            itemBuilder: (context, index) {
              LuckylakeapartmentsItemModel model = controller
                  .lightSearchResultsListModelObj
                  .value
                  .luckylakeapartmentsItemList
                  .value[index];
              return LuckylakeapartmentsItemWidget(model);
            })));
  }

  /// Navigates to the previous screen.
  onTapArrowLeft() {
    Get.back();
  }
}
