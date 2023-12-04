import 'controller/light_sign_in_blank_form_controller.dart';
import 'package:flutter/material.dart';
import 'package:projectkost/core/app_export.dart';
import 'package:projectkost/core/utils/validation_functions.dart';
import 'package:projectkost/widgets/custom_checkbox_button.dart';
import 'package:projectkost/widgets/custom_elevated_button.dart';
import 'package:projectkost/widgets/custom_icon_button.dart';
import 'package:projectkost/widgets/custom_text_form_field.dart';

// ignore_for_file: must_be_immutable
class LightSignInBlankFormScreen
    extends GetWidget<LightSignInBlankFormController> {
  LightSignInBlankFormScreen({Key? key}) : super(key: key);

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            body: Form(
                key: _formKey,
                child: Container(
                    width: double.maxFinite,
                    padding:
                        EdgeInsets.symmetric(horizontal: 24.h, vertical: 26.v),
                    child: Column(children: [
                      CustomImageView(
                          imagePath: ImageConstant.imgArrowLeft,
                          height: 28.adaptSize,
                          width: 28.adaptSize,
                          alignment: Alignment.centerLeft,
                          onTap: () {
                            onTapImgArrowLeft();
                          }),
                      SizedBox(height: 52.v),
                      CustomImageView(
                          imagePath: ImageConstant.imgVector101x96,
                          height: 101.v,
                          width: 96.h),
                      SizedBox(height: 44.v),
                      Text("msg_login_to_your_account".tr,
                          style: CustomTextStyles.headlineLargeGray90001),
                      SizedBox(height: 28.v),
                      CustomTextFormField(
                          controller: controller.emailController,
                          hintText: "lbl_email".tr,
                          hintStyle: theme.textTheme.bodyMedium!,
                          textInputType: TextInputType.emailAddress,
                          prefix: Container(
                              margin:
                                  EdgeInsets.fromLTRB(20.h, 20.v, 12.h, 20.v),
                              child: CustomImageView(
                                  imagePath: ImageConstant.imgIconlyBoldMessage,
                                  height: 20.adaptSize,
                                  width: 20.adaptSize)),
                          prefixConstraints: BoxConstraints(maxHeight: 60.v),
                          validator: (value) {
                            if (value == null ||
                                (!isValidEmail(value, isRequired: true))) {
                              return "err_msg_please_enter_valid_email".tr;
                            }
                            return null;
                          },
                          contentPadding: EdgeInsets.only(
                              top: 21.v, right: 30.h, bottom: 21.v),
                          borderDecoration: TextFormFieldStyleHelper.fillGray,
                          fillColor: appTheme.gray50),
                      SizedBox(height: 20.v),
                      Obx(() => CustomTextFormField(
                          controller: controller.passwordController,
                          hintText: "lbl_password".tr,
                          hintStyle: theme.textTheme.bodyMedium!,
                          textInputAction: TextInputAction.done,
                          textInputType: TextInputType.visiblePassword,
                          prefix: Container(
                              margin:
                                  EdgeInsets.fromLTRB(20.h, 20.v, 12.h, 20.v),
                              child: CustomImageView(
                                  imagePath: ImageConstant.imgBag,
                                  height: 20.adaptSize,
                                  width: 20.adaptSize)),
                          prefixConstraints: BoxConstraints(maxHeight: 60.v),
                          suffix: InkWell(
                              onTap: () {
                                controller.isShowPassword.value =
                                    !controller.isShowPassword.value;
                              },
                              child: Container(
                                  margin: EdgeInsets.fromLTRB(
                                      30.h, 20.v, 20.h, 20.v),
                                  child: CustomImageView(
                                      imagePath: ImageConstant.imgSettings,
                                      height: 20.adaptSize,
                                      width: 20.adaptSize))),
                          suffixConstraints: BoxConstraints(maxHeight: 60.v),
                          validator: (value) {
                            if (value == null ||
                                (!isValidPassword(value, isRequired: true))) {
                              return "err_msg_please_enter_valid_password".tr;
                            }
                            return null;
                          },
                          obscureText: controller.isShowPassword.value,
                          contentPadding: EdgeInsets.symmetric(vertical: 21.v),
                          borderDecoration: TextFormFieldStyleHelper.fillGray,
                          fillColor: appTheme.gray50)),
                      SizedBox(height: 20.v),
                      _buildEnglishLabel(),
                      SizedBox(height: 20.v),
                      CustomElevatedButton(
                          text: "lbl_sign_in".tr,
                          buttonStyle: CustomButtonStyles.fillBlue),
                      SizedBox(height: 23.v),
                      Text("msg_forgot_the_password".tr,
                          style: CustomTextStyles.titleMediumPrimarySemiBold),
                      SizedBox(height: 42.v),
                      _buildAutoLayoutHorizontal(),
                      SizedBox(height: 31.v),
                      Padding(
                          padding: EdgeInsets.symmetric(horizontal: 38.h),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CustomIconButton(
                                    height: 60.v,
                                    width: 88.h,
                                    padding: EdgeInsets.all(18.h),
                                    decoration:
                                        IconButtonStyleHelper.outlineGray,
                                    child: CustomImageView(
                                        imagePath: ImageConstant
                                            .imgAutoLayoutHorizontalWhiteA70024x24)),
                                Container(
                                    height: 60.v,
                                    width: 87.h,
                                    margin: EdgeInsets.only(left: 20.h),
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 30.h, vertical: 17.v),
                                    decoration: AppDecoration.outlineGray
                                        .copyWith(
                                            borderRadius: BorderRadiusStyle
                                                .roundedBorder16),
                                    child: CustomImageView(
                                        imagePath: ImageConstant.imgFrameRed500,
                                        height: 24.v,
                                        width: 23.h,
                                        alignment: Alignment.center)),
                                Padding(
                                    padding: EdgeInsets.only(left: 20.h),
                                    child: CustomIconButton(
                                        height: 60.v,
                                        width: 88.h,
                                        padding: EdgeInsets.all(18.h),
                                        decoration:
                                            IconButtonStyleHelper.outlineGray,
                                        child: CustomImageView(
                                            imagePath: ImageConstant
                                                .imgFrameBlack900)))
                              ])),
                      SizedBox(height: 33.v),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                                padding: EdgeInsets.only(bottom: 1.v),
                                child: Text("msg_don_t_have_an_account".tr,
                                    style: theme.textTheme.bodyMedium)),
                            Padding(
                                padding: EdgeInsets.only(left: 8.h),
                                child: Text("lbl_sign_up".tr,
                                    style: CustomTextStyles.titleSmallPrimary))
                          ]),
                      SizedBox(height: 5.v)
                    ])))));
  }

  /// Section Widget
  Widget _buildEnglishLabel() {
    return Obx(() => CustomCheckboxButton(
        text: "lbl_remember_me".tr,
        value: controller.englishLabel.value,
        padding: EdgeInsets.symmetric(vertical: 3.v),
        onChange: (value) {
          controller.englishLabel.value = value;
        }));
  }

  /// Section Widget
  Widget _buildAutoLayoutHorizontal() {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.h),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Padding(
                  padding: EdgeInsets.only(top: 11.v, bottom: 9.v),
                  child: SizedBox(width: 96.h, child: Divider())),
              Text("msg_or_continue_with".tr,
                  style: CustomTextStyles.titleMediumGray600),
              Padding(
                  padding: EdgeInsets.only(top: 11.v, bottom: 9.v),
                  child: SizedBox(width: 96.h, child: Divider()))
            ]));
  }

  /// Navigates to the previous screen.
  onTapImgArrowLeft() {
    Get.back();
  }
}
