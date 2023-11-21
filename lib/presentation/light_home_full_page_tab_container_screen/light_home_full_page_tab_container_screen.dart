// import 'controller/light_home_full_page_tab_container_controller.dart';
// import 'package:flutter/material.dart';
// import 'package:projectkost/core/app_export.dart';
// // import 'package:projectkost/presentation/dark_home_full_page/dark_home_full_page.dart';
// // import 'package:projectkost/presentation/dark_message_tab_container_page/dark_message_tab_container_page.dart';
// // import 'package:projectkost/presentation/light_explore_maps_version_one_page/light_explore_maps_version_one_page.dart';
// // import 'package:projectkost/presentation/light_favorites_card_page/light_favorites_card_page.dart';
// // import 'package:projectkost/presentation/light_home_fit_page/light_home_fit_page.dart';
// // import 'package:projectkost/presentation/light_profile_settings_page/light_profile_settings_page.dart';
// import 'package:projectkost/widgets/app_bar/appbar_leading_image.dart';
// import 'package:projectkost/widgets/app_bar/appbar_subtitle_four.dart';
// import 'package:projectkost/widgets/app_bar/appbar_subtitle_two.dart';
// import 'package:projectkost/widgets/app_bar/custom_app_bar.dart';
// import 'package:projectkost/widgets/custom_bottom_bar.dart';
// import 'package:projectkost/widgets/custom_elevated_button.dart';
// import 'package:projectkost/widgets/custom_search_view.dart';

// // ignore_for_file: must_be_immutable
// class LightHomeFullPageTabContainerScreen
//     extends GetWidget<LightHomeFullPageTabContainerController> {
//   const LightHomeFullPageTabContainerScreen({Key? key})
//       : super(
//           key: key,
//         );

//   @override
//   Widget build(BuildContext context) {
//     mediaQueryData = MediaQuery.of(context);

//     return SafeArea(
//       child: Scaffold(
//         resizeToAvoidBottomInset: false,
//         appBar: _buildAppBar(),
//         body: SizedBox(
//           width: double.maxFinite,
//           child: Column(
//             children: [
//               SizedBox(height: 20.v),
//               Expanded(
//                 child: SingleChildScrollView(
//                   child: Column(
//                     children: [
//                       Padding(
//                         padding: EdgeInsets.symmetric(horizontal: 24.h),
//                         child: CustomSearchView(
//                           controller: controller.searchController,
//                           hintText: "lbl_search".tr,
//                         ),
//                       ),
//                       SizedBox(height: 23.v),
//                       Padding(
//                         padding: EdgeInsets.symmetric(horizontal: 24.h),
//                         child: _buildAutoLayoutHorizontal(
//                           ourRecommendation: "lbl_featured".tr,
//                           seeAll: "lbl_see_all".tr,
//                         ),
//                       ),
//                       SizedBox(height: 24.v),
//                       _buildFortyEight(),
//                       SizedBox(height: 23.v),
//                       Padding(
//                         padding: EdgeInsets.symmetric(horizontal: 24.h),
//                         child: _buildAutoLayoutHorizontal(
//                           ourRecommendation: "msg_our_recommendation".tr,
//                           seeAll: "lbl_see_all".tr,
//                         ),
//                       ),
//                       SizedBox(height: 24.v)
//                     ],
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//         bottomNavigationBar: _buildBottomBar(),
//       ),
//     );
//   }

//   /// Section Widget
//   PreferredSizeWidget _buildAppBar() {
//     return CustomAppBar(
//       leadingWidth: 72.h,
//       leading: AppbarLeadingImage(
//         imagePath: ImageConstant.imgProfile,
//         margin: EdgeInsets.only(
//           left: 24.h,
//           top: 2.v,
//           bottom: 5.v,
//         ),
//       ),
//       title: Padding(
//         padding: EdgeInsets.only(left: 16.h),
//         child: Column(
//           children: [
//             AppbarSubtitleFour(
//               text: "lbl_good_morning".tr,
//               margin: EdgeInsets.only(right: 21.h),
//             ),
//             SizedBox(height: 8.v),
//             AppbarSubtitleTwo(
//               text: "lbl_andrew_ainsley".tr,
//             ),
//           ],
//         ),
//       ),
//       actions: [
//         Card(
//           clipBehavior: Clip.antiAlias,
//           elevation: 0,
//           margin: EdgeInsets.fromLTRB(24.h, 2.v, 24.h, 5.v),
//           shape: RoundedRectangleBorder(
//             side: BorderSide(
//               color: appTheme.gray200,
//               width: 1.h,
//             ),
//             borderRadius: BorderRadiusStyle.roundedBorder24,
//           ),
//           child: Container(
//             height: 48.adaptSize,
//             width: 48.adaptSize,
//             padding: EdgeInsets.all(12.h),
//             decoration: AppDecoration.outlineGray200.copyWith(
//               borderRadius: BorderRadiusStyle.roundedBorder24,
//             ),
//             child: Stack(
//               alignment: Alignment.topRight,
//               children: [
//                 CustomImageView(
//                   imagePath: ImageConstant.imgIconlyCurvedNotification,
//                   height: 24.adaptSize,
//                   width: 24.adaptSize,
//                   alignment: Alignment.center,
//                 ),
//                 Align(
//                   alignment: Alignment.topRight,
//                   child: Container(
//                     height: 6.adaptSize,
//                     width: 6.adaptSize,
//                     margin: EdgeInsets.fromLTRB(16.h, 2.v, 2.h, 16.v),
//                     decoration: BoxDecoration(
//                       color: appTheme.redA200,
//                       borderRadius: BorderRadius.circular(
//                         3.h,
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ],
//     );
//   }

//   /// Section Widget
//   Widget _buildFortyEight() {
//     return Align(
//       alignment: Alignment.centerRight,
//       child: SingleChildScrollView(
//         scrollDirection: Axis.horizontal,
//         padding: EdgeInsets.only(left: 24.h),
//         child: IntrinsicWidth(
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               SizedBox(
//                 height: 400.v,
//                 width: 300.h,
//                 child: Stack(
//                   alignment: Alignment.bottomCenter,
//                   children: [
//                     CustomImageView(
//                       imagePath: ImageConstant.imgRectangle400x300,
//                       height: 400.v,
//                       width: 300.h,
//                       radius: BorderRadius.circular(
//                         40.h,
//                       ),
//                       alignment: Alignment.center,
//                     ),
//                     Align(
//                       alignment: Alignment.bottomCenter,
//                       child: Column(
//                         mainAxisSize: MainAxisSize.min,
//                         children: [
//                           CustomElevatedButton(
//                             height: 32.v,
//                             width: 61.h,
//                             text: "lbl_4_8".tr,
//                             margin: EdgeInsets.only(right: 24.h),
//                             leftIcon: Container(
//                               margin: EdgeInsets.only(right: 4.h),
//                               child: CustomImageView(
//                                 imagePath: ImageConstant.imgIconlyBoldStar10x10,
//                                 height: 14.adaptSize,
//                                 width: 14.adaptSize,
//                               ),
//                             ),
//                             buttonStyle:
//                                 CustomButtonStyles.outlineOnErrorContainerTL16,
//                             buttonTextStyle: CustomTextStyles.titleSmallPrimary,
//                             alignment: Alignment.centerRight,
//                           ),
//                           SizedBox(height: 140.v),
//                           _buildFour(
//                             realEstateName: "msg_modernica_apartme".tr,
//                             cityCountry: "lbl_new_york_us".tr,
//                             price: "lbl_29".tr,
//                             night: "lbl_night".tr,
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               Container(
//                 height: 400.v,
//                 width: 300.h,
//                 margin: EdgeInsets.only(left: 20.h),
//                 child: Stack(
//                   alignment: Alignment.bottomCenter,
//                   children: [
//                     CustomImageView(
//                       imagePath: ImageConstant.imgRectangle7,
//                       height: 400.v,
//                       width: 300.h,
//                       radius: BorderRadius.circular(
//                         40.h,
//                       ),
//                       alignment: Alignment.center,
//                     ),
//                     Align(
//                       alignment: Alignment.bottomCenter,
//                       child: Column(
//                         mainAxisSize: MainAxisSize.min,
//                         children: [
//                           CustomElevatedButton(
//                             height: 32.v,
//                             width: 61.h,
//                             text: "lbl_4_6".tr,
//                             margin: EdgeInsets.only(right: 24.h),
//                             leftIcon: Container(
//                               margin: EdgeInsets.only(right: 4.h),
//                               child: CustomImageView(
//                                 imagePath: ImageConstant.imgIconlyBoldStar10x10,
//                                 height: 14.adaptSize,
//                                 width: 14.adaptSize,
//                               ),
//                             ),
//                             buttonStyle:
//                                 CustomButtonStyles.outlineOnErrorContainerTL16,
//                             buttonTextStyle: CustomTextStyles.titleSmallPrimary,
//                             alignment: Alignment.centerRight,
//                           ),
//                           SizedBox(height: 140.v),
//                           _buildFour(
//                             realEstateName: "lbl_merialla_villa".tr,
//                             cityCountry: "lbl_paris_france".tr,
//                             price: "lbl_32".tr,
//                             night: "lbl_night".tr,
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   /// Section Widget
//   Widget _buildTabview() {
//     return Container(
//       height: 38.v,
//       width: 404.h,
//       child: TabBar(
//         controller: controller.tabviewController,
//         isScrollable: true,
//         labelColor: appTheme.whiteA700,
//         labelStyle: TextStyle(
//           fontSize: 16.fSize,
//           fontFamily: 'Urbanist',
//           fontWeight: FontWeight.w600,
//         ),
//         unselectedLabelColor: theme.colorScheme.primary,
//         unselectedLabelStyle: TextStyle(
//           fontSize: 16.fSize,
//           fontFamily: 'Urbanist',
//           fontWeight: FontWeight.w600,
//         ),
//         indicator: BoxDecoration(
//           color: theme.colorScheme.primary,
//           borderRadius: BorderRadius.circular(
//             19.h,
//           ),
//         ),
//         tabs: [
//           Tab(
//             child: Text(
//               "lbl_all".tr,
//             ),
//           ),
//           Tab(
//             child: Text(
//               "lbl_house".tr,
//             ),
//           ),
//           Tab(
//             child: Text(
//               "lbl_villa".tr,
//             ),
//           ),
//           Tab(
//             child: Text(
//               "lbl_apartment".tr,
//             ),
//           ),
//           Tab(
//             child: Text(
//               "lbl_others".tr,
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   /// Section Widget
//   Widget _buildBottomBar() {
//     return CustomBottomBar(
//       onChanged: (BottomBarEnum type) {
//         // Get.toNamed(getCurrentRoute(type), id: 1);
//       },
//     );
//   }

//   /// Common widget
//   Widget _buildFour({
//     required String realEstateName,
//     required String cityCountry,
//     required String price,
//     required String night,
//   }) {
//     return Container(
//       padding: EdgeInsets.symmetric(
//         horizontal: 26.h,
//         vertical: 19.v,
//       ),
//       decoration: AppDecoration.gradientGrayToGrayB.copyWith(
//         borderRadius: BorderRadiusStyle.customBorderBL36,
//       ),
//       child: Column(
//         mainAxisSize: MainAxisSize.min,
//         mainAxisAlignment: MainAxisAlignment.end,
//         children: [
//           SizedBox(height: 59.v),
//           Align(
//             alignment: Alignment.centerLeft,
//             child: Text(
//               realEstateName,
//               style: theme.textTheme.headlineSmall!.copyWith(
//                 color: appTheme.whiteA700,
//               ),
//             ),
//           ),
//           SizedBox(height: 13.v),
//           Text(
//             cityCountry,
//             style: CustomTextStyles.bodyLarge16.copyWith(
//               color: appTheme.whiteA700,
//             ),
//           ),
//           SizedBox(height: 10.v),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Text(
//                 price,
//                 style: theme.textTheme.headlineSmall!.copyWith(
//                   color: appTheme.whiteA700,
//                 ),
//               ),
//               Padding(
//                 padding: EdgeInsets.only(
//                   left: 4.h,
//                   top: 9.v,
//                   bottom: 2.v,
//                 ),
//                 child: Text(
//                   night,
//                   style: CustomTextStyles.bodyMediumWhiteA700.copyWith(
//                     color: appTheme.whiteA700,
//                   ),
//                 ),
//               ),
//               Spacer(),
//               CustomImageView(
//                 imagePath: ImageConstant.imgIconlyLightOutlineHeartWhiteA700,
//                 height: 28.adaptSize,
//                 width: 28.adaptSize,
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }

//   /// Common widget
//   Widget _buildAutoLayoutHorizontal({
//     required String ourRecommendation,
//     required String seeAll,
//   }) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//         Text(
//           ourRecommendation,
//           style: CustomTextStyles.titleLargeGray90001.copyWith(
//             color: appTheme.gray90001,
//           ),
//         ),
//         Padding(
//           padding: EdgeInsets.only(bottom: 2.v),
//           child: Text(
//             seeAll,
//             style: CustomTextStyles.titleMediumPrimary.copyWith(
//               color: theme.colorScheme.primary,
//             ),
//           ),
//         ),
//       ],
//     );
//   }

//   ///Handling route based on bottom click actions
//   // String getCurrentRoute(BottomBarEnum type) {
//   //   switch (type) {
//   //     case BottomBarEnum.Home:
//   //     return AppRoutes.lightHomeFitPage;
//   //     case BottomBarEnum.Explore:
//   //     return AppRoutes.lightExploreMapsVersionOnePage;
//   //     case BottomBarEnum.Favorites:
//   //     return AppRoutes.lightFavoritesCardPage;
//   //     case BottomBarEnum.Message:
//   //     return AppRoutes.darkMessageTabContainerPage;
//   //     case BottomBarEnum.Profile:
//   //     return AppRoutes.lightProfileSettingsPage;
//   //     default:
//   //       return "/";
//   //   }
//   // }

//   ///Handling page based on route
//   // Widget getCurrentPage(String currentRoute) {
//   //   switch (currentRoute) {
//   //     case AppRoutes.lightHomeFitPage:
//   //       return LightHomeFitPage();
//   //     case AppRoutes.lightExploreMapsVersionOnePage:
//   //       return LightExploreMapsVersionOnePage();
//   //     case AppRoutes.lightFavoritesCardPage:
//   //       return LightFavoritesCardPage();
//   //     case AppRoutes.darkMessageTabContainerPage:
//   //       return DarkMessageTabContainerPage();
//   //     case AppRoutes.lightProfileSettingsPage:
//   //       return LightProfileSettingsPage();
//   //     default:
//   //       return DefaultWidget();
//   //   }
//   // }
// }
