import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:projectkost/core/app_export.dart';
import 'package:projectkost/pages/active_property.dart';
import 'package:projectkost/pages/auth_checker.dart';
import 'package:projectkost/pages/create_page.dart';
import 'package:projectkost/pages/home_property.dart';
import 'package:projectkost/pages/profile_page.dart';
import 'package:projectkost/widgets/app_bar/appbar_leading_circleimage.dart';
import 'package:projectkost/widgets/app_bar/appbar_subtitle.dart';
import 'package:projectkost/widgets/app_bar/appbar_trailing_image.dart';
import 'package:projectkost/widgets/app_bar/custom_app_bar.dart';
import 'package:projectkost/widgets/custom_bottom_bar.dart';
import 'package:projectkost/pages/home_page.dart';
import 'package:firebase_auth/firebase_auth.dart';

class HomeProfile extends StatefulWidget {
  const HomeProfile({super.key});
  @override
  State<HomeProfile> createState() => _HomeProfileState();
}

class _HomeProfileState extends State<HomeProfile> {
  final user = FirebaseAuth.instance.currentUser;
  String username = '';
  var urlImageProfile;

  @override
  void initState() {
    super.initState();
    userData();
  }

  void userData() async {
    DataSnapshot snapshot =
        await FirebaseDatabase.instance.ref('users/${user?.uid}').get();

    Map dataUser = snapshot.value as Map;
    setState(() {
      username = dataUser['username'].toString();
      urlImageProfile = dataUser['urlImageProfile'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return AuthChecker(
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
                      imagePath:
                          urlImageProfile ?? ImageConstant.imgEllipse160x160,
                      height: 140.adaptSize,
                      width: 140.adaptSize,
                      radius: BorderRadius.circular(
                        70.h,
                      ),
                      alignment: Alignment.center,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 14.v),
              Text(
                username.tr,
                style: CustomTextStyles.headlineSmallGray90001,
              ),
              SizedBox(height: 21.v),
              const Divider(),
              SizedBox(height: 23.v),
              _buildAutoLayoutHorizontal(
                iconlyCurvedWallet:
                    ImageConstant.imgIconlyCurvedCalendarGray90001,
                payments: "Kontrakan Saya".tr,
                onPressed: () async {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const HomeProperty()),
                  );
                },
              ),
              SizedBox(height: 20.v),
              _buildAutoLayoutHorizontal(
                iconlyCurvedWallet: ImageConstant.imgIconlyCurvedWallet,
                payments: "Buat Kontrakan".tr,
                onPressed: () async {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const CreatePage()),
                  );
                },
              ),
              SizedBox(height: 20.v),
              _buildAutoLayoutHorizontal(
                iconlyCurvedWallet: ImageConstant.imgIconlyCurvedWallet,
                payments: "Aktivasi Kontrakan".tr,
                onPressed: () async {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ActiveProperty()),
                  );
                },
              ),
              SizedBox(height: 20.v),
              const Divider(),
              SizedBox(height: 19.v),
              _buildAutoLayoutHorizontal(
                iconlyCurvedWallet: ImageConstant.imgUserGray90001,
                payments: "Profile".tr,
                onPressed: () async {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ProfilePage()),
                  );
                },
              ),
              SizedBox(height: 19.v),
              const Divider(),
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
                      child: TextButton(
                        onPressed: () async {
                          await FirebaseAuth.instance.signOut();
                        },
                        child: Text(
                          "Logout".tr,
                          style: CustomTextStyles.titleMediumRedA200,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: _buildBottomBar(),
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
        text: "Bapak KOS".tr,
        margin: EdgeInsets.only(left: 16.h),
      ),
      actions: [
        AppbarTrailingImage(
          imagePath: ImageConstant.imgIconlyCurvedLogout,
          margin: EdgeInsets.fromLTRB(24.h, 14.v, 24.h, 13.v),
          onTap: () async {
            FirebaseAuth.instance.signOut();
          },
        ),
      ],
    );
  }

  Widget _buildAutoLayoutHorizontal({
    required String iconlyCurvedWallet,
    required String payments,
    required VoidCallback onPressed,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomImageView(
          imagePath: iconlyCurvedWallet,
          height: 28.adaptSize,
          width: 28.adaptSize,
          onTap: onPressed,
        ),
        Padding(
          padding: EdgeInsets.only(
            left: 20.h,
            top: 5.v,
          ),
          child: TextButton(
            onPressed: onPressed,
            child: Text(
              payments.tr,
              style: CustomTextStyles.titleMediumGray90001SemiBold18.copyWith(
                color: appTheme.gray90001,
              ),
            ),
          ),
        ),
        const Spacer(),
        CustomImageView(
          imagePath: ImageConstant.imgArrowRight,
          height: 20.adaptSize,
          width: 20.adaptSize,
          margin: EdgeInsets.symmetric(vertical: 4.v),
          onTap: onPressed,
        ),
      ],
    );
  }

  Widget _buildBottomBar() {
    return CustomBottomBar(
      onChanged: (BottomBarEnum type) {
        navigateToPage(type);
      },
      selectedIndex: 2.obs,
    );
  }

  void navigateToPage(BottomBarEnum type) {
    String routeName = getCurrentRoute(type);
    Widget nextPage = getCurrentPage(routeName);

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => nextPage),
    );
  }

  String getCurrentRoute(BottomBarEnum type) {
    switch (type) {
      case BottomBarEnum.Home:
        return AppRoutes.homePage;
      case BottomBarEnum.Explore:
        return AppRoutes.explorePage;
      case BottomBarEnum.Profile:
        return AppRoutes.homeProfile;
      default:
        return AppRoutes.homeProfile;
    }
  }

  Widget getCurrentPage(String currentRoute) {
    switch (currentRoute) {
      case AppRoutes.homePage:
        return const HomePage();
      case AppRoutes.explorePage:
      // return ExplorePage();
      case AppRoutes.homeProfile:
        return const HomeProfile();
      default:
        return const HomeProfile();
    }
  }
}
