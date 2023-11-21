import 'controller/light_profile_settings_controller.dart';
import 'models/light_profile_settings_model.dart';
import 'package:flutter/material.dart';
import 'package:projectkost/core/app_export.dart';
import 'package:projectkost/widgets/app_bar/appbar_leading_circleimage.dart';
import 'package:projectkost/widgets/app_bar/appbar_subtitle.dart';
import 'package:projectkost/widgets/app_bar/appbar_trailing_image.dart';
import 'package:projectkost/widgets/app_bar/custom_app_bar.dart';
import 'package:projectkost/widgets/custom_switch.dart';

class LightProfileSettingsPage extends StatelessWidget {
  LightProfileSettingsPage({Key? key})
      : super(
          key: key,
        );

  LightProfileSettingsController controller =
      Get.put(LightProfileSettingsController(LightProfileSettingsModel().obs));

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return SafeArea(
      child: Scaffold(
        appBar: _buildAppBar(),
        body: Container(
          width: double.maxFinite,
          padding: EdgeInsets.symmetric(horizontal: 24.h),
          child: Column(
            children: [
              SizedBox(height: 20.v),
              SizedBox(
                height: 140.adaptSize,
                width: 140.adaptSize,
                child: Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    CustomImageView(
                      imagePath: ImageConstant.imgEllipse140x140,
                      height: 140.adaptSize,
                      width: 140.adaptSize,
                      radius: BorderRadius.circular(
                        70.h,
                      ),
                      alignment: Alignment.center,
                    ),
                    CustomImageView(
                      imagePath: ImageConstant.imgEdit,
                      height: 35.adaptSize,
                      width: 35.adaptSize,
                      alignment: Alignment.bottomRight,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 14.v),
              Text(
                "lbl_andrew_ainsley".tr,
                style: CustomTextStyles.headlineSmallGray90001,
              ),
              SizedBox(height: 21.v),
              Divider(),
              SizedBox(height: 23.v),
              _buildAutoLayoutHorizontal(
                iconlyCurvedWallet:
                    ImageConstant.imgIconlyCurvedCalendarGray90001,
                payments: "lbl_my_booking".tr,
              ),
              SizedBox(height: 20.v),
              _buildAutoLayoutHorizontal(
                iconlyCurvedWallet: ImageConstant.imgIconlyCurvedWallet,
                payments: "lbl_payments".tr,
              ),
              SizedBox(height: 20.v),
              Divider(),
              SizedBox(height: 19.v),
              _buildAutoLayoutHorizontal(
                iconlyCurvedWallet: ImageConstant.imgUserGray90001,
                payments: "lbl_profile".tr,
              ),
              SizedBox(height: 20.v),
              _buildAutoLayoutHorizontal(
                iconlyCurvedWallet: ImageConstant.imgIconlyCurvedNotification,
                payments: "lbl_notification".tr,
              ),
              SizedBox(height: 20.v),
              _buildAutoLayoutHorizontal(
                iconlyCurvedWallet: ImageConstant.imgIconlyCurvedShield,
                payments: "lbl_security".tr,
              ),
              SizedBox(height: 20.v),
              _buildAutoLayoutHorizontal6(),
              SizedBox(height: 20.v),
              _buildAutoLayoutHorizontal7(),
              SizedBox(height: 20.v),
              _buildAutoLayoutHorizontal(
                iconlyCurvedWallet: ImageConstant.imgIconlyCurvedInfo,
                payments: "lbl_help_center".tr,
              ),
              SizedBox(height: 20.v),
              _buildAutoLayoutHorizontal(
                iconlyCurvedWallet: ImageConstant.imgIconlyCurved3,
                payments: "lbl_invite_friends".tr,
              ),
              SizedBox(height: 20.v),
              Align(
                alignment: Alignment.centerLeft,
                child: Row(
                  children: [
                    CustomImageView(
                      imagePath: ImageConstant.imgIconlyCurvedLogout,
                      height: 28.adaptSize,
                      width: 28.adaptSize,
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        left: 20.h,
                        top: 5.v,
                      ),
                      child: Text(
                        "lbl_logout".tr,
                        style: CustomTextStyles.titleMediumRedA200,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar() {
    return CustomAppBar(
      leadingWidth: 52.h,
      leading: AppbarLeadingCircleimage(
        imagePath: ImageConstant.imgVector101x96,
        margin: EdgeInsets.only(
          left: 24.h,
          top: 14.v,
          bottom: 13.v,
        ),
      ),
      title: AppbarSubtitle(
        text: "lbl_profile".tr,
        margin: EdgeInsets.only(left: 16.h),
      ),
      actions: [
        AppbarTrailingImage(
          imagePath: ImageConstant.imgIconlyLightMore,
          margin: EdgeInsets.fromLTRB(24.h, 14.v, 24.h, 13.v),
        ),
      ],
    );
  }

  /// Section Widget
  Widget _buildAutoLayoutHorizontal6() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomImageView(
          imagePath: ImageConstant.imgIconlyCurvedMore,
          height: 28.adaptSize,
          width: 28.adaptSize,
        ),
        Padding(
          padding: EdgeInsets.only(
            left: 20.h,
            top: 5.v,
          ),
          child: Text(
            "lbl_language".tr,
            style: CustomTextStyles.titleMediumGray90001SemiBold18,
          ),
        ),
        Spacer(),
        Padding(
          padding: EdgeInsets.only(top: 5.v),
          child: Text(
            "lbl_english_us".tr,
            style: CustomTextStyles.titleMediumGray90001SemiBold18,
          ),
        ),
        CustomImageView(
          imagePath: ImageConstant.imgArrowRight,
          height: 20.adaptSize,
          width: 20.adaptSize,
          margin: EdgeInsets.only(
            left: 20.h,
            top: 4.v,
            bottom: 4.v,
          ),
        ),
      ],
    );
  }

  /// Section Widget
  Widget _buildAutoLayoutHorizontal7() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomImageView(
          imagePath: ImageConstant.imgIconlyCurvedShow,
          height: 28.adaptSize,
          width: 28.adaptSize,
        ),
        Padding(
          padding: EdgeInsets.only(
            left: 20.h,
            top: 2.v,
            bottom: 3.v,
          ),
          child: Text(
            "lbl_dark_mode".tr,
            style: CustomTextStyles.titleMediumGray90001SemiBold18,
          ),
        ),
        Spacer(),
        Obx(
          () => CustomSwitch(
            value: controller.isSelectedSwitch.value,
            onChange: (value) {
              controller.isSelectedSwitch.value = value;
            },
          ),
        ),
      ],
    );
  }

  /// Common widget
  Widget _buildAutoLayoutHorizontal({
    required String iconlyCurvedWallet,
    required String payments,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomImageView(
          imagePath: iconlyCurvedWallet,
          height: 28.adaptSize,
          width: 28.adaptSize,
        ),
        Padding(
          padding: EdgeInsets.only(
            left: 20.h,
            top: 5.v,
          ),
          child: Text(
            payments,
            style: CustomTextStyles.titleMediumGray90001SemiBold18.copyWith(
              color: appTheme.gray90001,
            ),
          ),
        ),
        Spacer(),
        CustomImageView(
          imagePath: ImageConstant.imgArrowRight,
          height: 20.adaptSize,
          width: 20.adaptSize,
          margin: EdgeInsets.symmetric(vertical: 4.v),
        ),
      ],
    );
  }
}
