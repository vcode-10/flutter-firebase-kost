import 'package:flutter/material.dart';
import 'package:projectkost/core/app_export.dart';
import 'package:projectkost/widgets/custom_text_form_field.dart';

// ignore: must_be_immutable
class AppbarTitleEdittextOne extends StatelessWidget {
  AppbarTitleEdittextOne({
    Key? key,
    this.hintText,
    this.controller,
    this.margin,
  }) : super(
          key: key,
        );

  String? hintText;

  TextEditingController? controller;

  EdgeInsetsGeometry? margin;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin ?? EdgeInsets.zero,
      child: CustomTextFormField(
        width: 336.h,
        controller: controller,
        hintText: "Search".tr,
        prefix: Container(
          margin: EdgeInsets.fromLTRB(20.h, 18.v, 12.h, 18.v),
          child: CustomImageView(
            imagePath: ImageConstant.imgSearch,
            height: 20.adaptSize,
            width: 20.adaptSize,
          ),
        ),
        prefixConstraints: BoxConstraints(
          maxHeight: 56.v,
        ),
        suffix: Container(
          margin: EdgeInsets.fromLTRB(30.h, 18.v, 20.h, 18.v),
          child: CustomImageView(
            imagePath: ImageConstant.imgIconlyBoldFilter,
            height: 20.adaptSize,
            width: 20.adaptSize,
          ),
        ),
        suffixConstraints: BoxConstraints(
          maxHeight: 56.v,
        ),
        borderDecoration: TextFormFieldStyleHelper.fillGrayTL16,
        fillColor: appTheme.gray100,
      ),
    );
  }
}
