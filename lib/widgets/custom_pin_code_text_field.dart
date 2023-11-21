import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:projectkost/core/app_export.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class CustomPinCodeTextField extends StatelessWidget {
  CustomPinCodeTextField({
    Key? key,
    required this.context,
    required this.onChanged,
    this.alignment,
    this.controller,
    this.textStyle,
    this.hintStyle,
    this.validator,
  }) : super(
          key: key,
        );

  final Alignment? alignment;

  final BuildContext context;

  final TextEditingController? controller;

  final TextStyle? textStyle;

  final TextStyle? hintStyle;

  Function(String) onChanged;

  final FormFieldValidator<String>? validator;

  @override
  Widget build(BuildContext context) {
    return alignment != null
        ? Align(
            alignment: alignment ?? Alignment.center,
            child: pinCodeTextFieldWidget,
          )
        : pinCodeTextFieldWidget;
  }

  Widget get pinCodeTextFieldWidget => PinCodeTextField(
        appContext: context,
        controller: controller,
        length: 6,
        keyboardType: TextInputType.number,
        textStyle: textStyle ?? CustomTextStyles.headlineSmallGray90001,
        hintStyle: hintStyle ?? CustomTextStyles.headlineSmallGray90001,
        inputFormatters: [
          FilteringTextInputFormatter.digitsOnly,
        ],
        enableActiveFill: true,
        pinTheme: PinTheme(
          fieldHeight: 61.h,
          fieldWidth: 83.h,
          shape: PinCodeFieldShape.box,
          borderRadius: BorderRadius.circular(16.h),
          inactiveColor: appTheme.gray200,
          activeColor: appTheme.gray200,
          inactiveFillColor: appTheme.gray50,
          activeFillColor: appTheme.gray50,
          selectedColor: appTheme.gray80001,
          selectedFillColor: appTheme.gray900,
        ),
        onChanged: (value) => onChanged(value),
        validator: validator,
      );
}
