import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:projectkost/pages/home_profile.dart';
import 'package:projectkost/widgets/app_bar/appbar_leading_image.dart';
import 'package:projectkost/widgets/app_bar/appbar_subtitle_four.dart';
import 'package:projectkost/widgets/app_bar/appbar_subtitle_two.dart';
import 'package:projectkost/widgets/app_bar/custom_app_bar.dart';
import 'package:projectkost/widgets/custom_bottom_bar.dart';
import 'package:projectkost/widgets/custom_search_view.dart';
import 'package:projectkost/core/app_export.dart';
import 'package:projectkost/presentation/light_home_full_page/widgets/realestatecard_item_widget.dart';
import 'package:projectkost/presentation/light_home_full_page/controller/light_home_full_controller.dart';
import 'package:projectkost/presentation/light_home_full_page/models/light_home_full_model.dart';
import 'package:projectkost/presentation/light_home_full_page/models/realestatecard_item_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _searchController = TextEditingController();
  final user = FirebaseAuth.instance.currentUser;
  String username = '';
  var urlImageProfile;

  LightHomeFullController controller =
      Get.put(LightHomeFullController(LightHomeFullModel().obs));

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
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: _buildAppBar(),
        body: SizedBox(
          width: double.maxFinite,
          child: Column(
            children: [
              SizedBox(height: 20.v),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 24.h),
                        child: CustomSearchView(
                          controller: _searchController,
                          hintText: "Search".tr,
                        ),
                      ),
                      SizedBox(height: 24.v),
                      _buildRealEstateCard(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: _buildBottomBar(),
      ),
    );
  }

  Widget _buildRealEstateCard() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.h),
      child: Obx(
        () => GridView.builder(
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            mainAxisExtent: 275.v,
            crossAxisCount: 2,
            mainAxisSpacing: 16.h,
            crossAxisSpacing: 16.h,
          ),
          physics: const NeverScrollableScrollPhysics(),
          itemCount: controller
              .lightHomeFullModelObj.value.realestatecardItemList.value.length,
          itemBuilder: (context, index) {
            RealestatecardItemModel model = controller.lightHomeFullModelObj
                .value.realestatecardItemList.value[index];
            return RealestatecardItemWidget(
              model,
            );
          },
        ),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return CustomAppBar(
      leadingWidth: 72.h,
      leading: AppbarLeadingImage(
        imagePath: urlImageProfile ?? ImageConstant.imgEllipse160x160,
        margin: EdgeInsets.only(
          left: 24.h,
          top: 2.v,
          bottom: 5.v,
        ),
      ),
      title: Padding(
        padding: EdgeInsets.only(left: 16.h),
        child: Column(
          children: [
            AppbarSubtitleFour(
              text: "Selamat datang!,".tr,
              margin: EdgeInsets.only(right: 21.h),
            ),
            SizedBox(height: 8.v),
            AppbarSubtitleTwo(
              text: username.tr,
            ),
          ],
        ),
      ),
      actions: [
        Card(
          clipBehavior: Clip.antiAlias,
          elevation: 0,
          margin: EdgeInsets.fromLTRB(24.h, 2.v, 24.h, 5.v),
          shape: RoundedRectangleBorder(
            side: BorderSide(
              color: appTheme.gray200,
              width: 1.h,
            ),
            borderRadius: BorderRadiusStyle.roundedBorder24,
          ),
          child: Container(
            height: 48.adaptSize,
            width: 48.adaptSize,
            padding: EdgeInsets.all(12.h),
            decoration: AppDecoration.outlineGray200.copyWith(
              borderRadius: BorderRadiusStyle.roundedBorder24,
            ),
            child: Stack(
              alignment: Alignment.topRight,
              children: [
                CustomImageView(
                  imagePath: ImageConstant.imgIconlyCurvedLogout,
                  height: 24.adaptSize,
                  width: 24.adaptSize,
                  alignment: Alignment.center,
                  onTap: () async {
                    FirebaseAuth.instance.signOut();
                  },
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: Container(
                    height: 6.adaptSize,
                    width: 6.adaptSize,
                    margin: EdgeInsets.fromLTRB(16.h, 2.v, 2.h, 16.v),
                    decoration: BoxDecoration(
                      color: appTheme.redA200,
                      borderRadius: BorderRadius.circular(
                        3.h,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildBottomBar() {
    return CustomBottomBar(
      onChanged: (BottomBarEnum type) {
        navigateToPage(type);
      },
      selectedIndex: 0.obs,
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
        return AppRoutes.homePage;
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
        return const HomePage();
    }
  }
}
