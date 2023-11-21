import 'package:flutter/material.dart';
import 'package:projectkost/core/app_export.dart';

class CustomIconButton extends StatelessWidget {
  CustomIconButton({
    Key? key,
    this.alignment,
    this.height,
    this.width,
    this.padding,
    this.decoration,
    this.child,
    this.onTap,
  }) : super(
          key: key,
        );

  final Alignment? alignment;

  final double? height;

  final double? width;

  final EdgeInsetsGeometry? padding;

  final BoxDecoration? decoration;

  final Widget? child;

  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return alignment != null
        ? Align(
            alignment: alignment ?? Alignment.center,
            child: iconButtonWidget,
          )
        : iconButtonWidget;
  }

  Widget get iconButtonWidget => SizedBox(
        height: height ?? 0,
        width: width ?? 0,
        child: IconButton(
          padding: EdgeInsets.zero,
          icon: Container(
            height: height ?? 0,
            width: width ?? 0,
            padding: padding ?? EdgeInsets.zero,
            decoration: decoration ??
                BoxDecoration(
                  color: theme.colorScheme.primary.withOpacity(0.08),
                  borderRadius: BorderRadius.circular(30.h),
                ),
            child: child,
          ),
          onPressed: onTap,
        ),
      );
}

/// Extension on [CustomIconButton] to facilitate inclusion of all types of border style etc
extension IconButtonStyleHelper on CustomIconButton {
  static BoxDecoration get gradientPrimaryToBlueA => BoxDecoration(
        borderRadius: BorderRadius.circular(30.h),
        gradient: LinearGradient(
          begin: Alignment(1.0, 1),
          end: Alignment(0.0, 0),
          colors: [
            theme.colorScheme.primary,
            appTheme.blueA200,
          ],
        ),
      );
  static BoxDecoration get outlineGray => BoxDecoration(
        color: appTheme.whiteA700,
        borderRadius: BorderRadius.circular(16.h),
        border: Border.all(
          color: appTheme.gray200,
          width: 1.h,
        ),
      );
  static BoxDecoration get fillBlue => BoxDecoration(
        color: appTheme.blue5001,
        borderRadius: BorderRadius.circular(28.h),
      );
  static BoxDecoration get fillOnPrimaryContainer => BoxDecoration(
        color: theme.colorScheme.onPrimaryContainer,
        borderRadius: BorderRadius.circular(30.h),
      );
  static BoxDecoration get fillGreen => BoxDecoration(
        color: appTheme.green50014,
        borderRadius: BorderRadius.circular(30.h),
      );
  static BoxDecoration get fillBlueTL20 => BoxDecoration(
        color: appTheme.blue5001,
        borderRadius: BorderRadius.circular(20.h),
      );
  static BoxDecoration get gradientPrimaryToBlueATL14 => BoxDecoration(
        borderRadius: BorderRadius.circular(14.h),
        gradient: LinearGradient(
          begin: Alignment(1.0, 1),
          end: Alignment(0.0, 0),
          colors: [
            theme.colorScheme.primary,
            appTheme.blueA200,
          ],
        ),
      );
  static BoxDecoration get gradientPrimaryToBlueATL28 => BoxDecoration(
        borderRadius: BorderRadius.circular(28.h),
        boxShadow: [
          BoxShadow(
            color: theme.colorScheme.primary.withOpacity(0.25),
            spreadRadius: 2.h,
            blurRadius: 2.h,
            offset: Offset(
              4,
              8,
            ),
          ),
        ],
        gradient: LinearGradient(
          begin: Alignment(1.0, 1),
          end: Alignment(0.0, 0),
          colors: [
            theme.colorScheme.primary,
            appTheme.blueA200,
          ],
        ),
      );
  static BoxDecoration get outlineOnErrorContainer => BoxDecoration(
        color: appTheme.gray200E5.withOpacity(0.32),
        borderRadius: BorderRadius.circular(34.h),
        boxShadow: [
          BoxShadow(
            color: theme.colorScheme.onErrorContainer.withOpacity(0.08),
            spreadRadius: 2.h,
            blurRadius: 2.h,
            offset: Offset(
              0,
              20,
            ),
          ),
        ],
      );
  static BoxDecoration get gradientPrimaryToBlueATL36 => BoxDecoration(
        borderRadius: BorderRadius.circular(36.h),
        gradient: LinearGradient(
          begin: Alignment(1.0, 1),
          end: Alignment(0.0, 0),
          colors: [
            theme.colorScheme.primary,
            appTheme.blueA200,
          ],
        ),
      );
  static BoxDecoration get gradientOnErrorToPinkA => BoxDecoration(
        borderRadius: BorderRadius.circular(36.h),
        gradient: LinearGradient(
          begin: Alignment(1.0, 1),
          end: Alignment(0.0, 0),
          colors: [
            theme.colorScheme.onError,
            appTheme.pinkA100,
          ],
        ),
      );
  static BoxDecoration get gradientOrangeAToOrangeA => BoxDecoration(
        borderRadius: BorderRadius.circular(36.h),
        gradient: LinearGradient(
          begin: Alignment(1.0, 1),
          end: Alignment(0.0, 0),
          colors: [
            appTheme.orangeA400,
            appTheme.orangeA200,
          ],
        ),
      );
  static BoxDecoration get fillErrorContainer => BoxDecoration(
        color: theme.colorScheme.errorContainer,
        borderRadius: BorderRadius.circular(36.h),
      );
  static BoxDecoration get gradientTealToTealA => BoxDecoration(
        borderRadius: BorderRadius.circular(36.h),
        gradient: LinearGradient(
          begin: Alignment(1.0, 1),
          end: Alignment(0.0, 0),
          colors: [
            appTheme.teal400,
            appTheme.tealA400,
          ],
        ),
      );
  static BoxDecoration get fillDeepPurple => BoxDecoration(
        color: appTheme.deepPurple500,
        borderRadius: BorderRadius.circular(36.h),
      );
  static BoxDecoration get fillRedA => BoxDecoration(
        color: appTheme.redA200,
        borderRadius: BorderRadius.circular(34.h),
      );
  static BoxDecoration get fillPrimaryTL20 => BoxDecoration(
        color: theme.colorScheme.primary.withOpacity(0.08),
        borderRadius: BorderRadius.circular(20.h),
      );
}
