import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:projectkost/pages/home_profile.dart';
import 'package:projectkost/pages/property_page.dart';
import 'package:projectkost/pages/search_page.dart';
import 'package:projectkost/widgets/app_bar/appbar_leading_image.dart';
import 'package:projectkost/widgets/app_bar/appbar_subtitle_four.dart';
import 'package:projectkost/widgets/app_bar/appbar_subtitle_two.dart';
import 'package:projectkost/widgets/app_bar/custom_app_bar.dart';
import 'package:projectkost/widgets/custom_bottom_bar.dart';
import 'package:projectkost/core/app_export.dart';
import 'package:projectkost/widgets/custom_elevated_button.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final user = FirebaseAuth.instance.currentUser;
  String username = '';
  var urlImageProfile;
  DatabaseReference propertiesRef =
      FirebaseDatabase.instance.reference().child('properties');
  List<Map<dynamic, dynamic>> propertiesList = [];

  int queryStart = 1;
  int queryEnd = 1;
  var tipeRaw = 'status';

  @override
  void initState() {
    super.initState();
    userData();
    propertyData();
  }

  void userData() async {
    DataSnapshot snapshot =
        await FirebaseDatabase.instance.ref('users/${user?.uid}').get();

    Map dataUser = snapshot.value as Map;
    setState(() {
      username = dataUser['username']
          .toString()
          .split(' ')
          .map((word) => word.isNotEmpty
              ? '${word[0].toUpperCase()}${word.substring(1)}'
              : '')
          .join(' ');
      urlImageProfile = dataUser['urlImageProfile'];
    });
  }

  void updateQuery(String newTipeRaw, int newHargaAwal, int newHargaAkhir) {
    setState(() {
      tipeRaw = newTipeRaw;
      queryStart = newHargaAwal;
      queryEnd = newHargaAkhir;
    });

    propertyData();
  }

  void propertyData() async {
    propertiesRef
        .orderByChild(tipeRaw)
        .startAt(queryStart)
        .endAt(queryEnd)
        .onValue
        .listen((event) {
      if (mounted) {
        setState(() {
          propertiesList.clear();
          if (event.snapshot.value is Map) {
            (event.snapshot.value as Map).forEach((key, value) {
              Map property = value;
              property['key'] = key;
              propertiesList.add(property);
            });
          }
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: _buildAppBar(),
        body: SizedBox(
          width: double.maxFinite,
          child: Column(
            children: [
              SizedBox(height: 24.v),
              _buildAll(),
              SizedBox(height: 20.v),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.h),
                child: GridView.builder(
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    mainAxisExtent: 275.v,
                    crossAxisCount: 2,
                    mainAxisSpacing: 16.h,
                    crossAxisSpacing: 16.h,
                  ),
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: propertiesList.length,
                  itemBuilder: (context, index) {
                    return buildPropertyCard(
                      propertiesList[index],
                    );
                  },
                ),
              )
            ],
          ),
        ),
        bottomNavigationBar: _buildBottomBar(),
      ),
    );
  }

  Widget _buildAll() {
    return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: IntrinsicWidth(
            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: 8.0), // Adjust the horizontal padding as needed
            child: CustomElevatedButton(
              height: 50.v,
              width: 80.h,
              text: 'All',
              onPressed: () {
                updateQuery('status', 1, 1);
              },
              decoration: AppDecoration.fillPrimary1
                  .copyWith(borderRadius: BorderRadiusStyle.roundedBorder20),
              buttonStyle: CustomButtonStyles.outlinePrimary,
              buttonTextStyle: CustomTextStyles.titleMediumSemiBold_1,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: 8.0), // Adjust the horizontal padding as needed
            child: CustomElevatedButton(
              height: 50.v,
              width: 100.h,
              text: '0 - 500K',
              onPressed: () {
                updateQuery('hargaPerBulan', 0, 500000);
              },
              decoration: AppDecoration.fillPrimary1
                  .copyWith(borderRadius: BorderRadiusStyle.roundedBorder20),
              buttonStyle: CustomButtonStyles.outlinePrimary,
              buttonTextStyle: CustomTextStyles.titleMediumSemiBold_1,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: 8.0), // Adjust the horizontal padding as needed
            child: CustomElevatedButton(
              height: 50.v,
              width: 120.h,
              text: '500 - 1000K',
              onPressed: () {
                updateQuery('hargaPerBulan', 900000, 1000000);
              },
              decoration: AppDecoration.fillPrimary1
                  .copyWith(borderRadius: BorderRadiusStyle.roundedBorder20),
              buttonStyle: CustomButtonStyles.outlinePrimary,
              buttonTextStyle: CustomTextStyles.titleMediumSemiBold_1,
            ),
          ),
        ])));
  }

  Widget buildPropertyCard(Map property) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => PropertyPage(
              property_key: property['key'] ?? '',
            ),
          ),
        );
      },
      child: Container(
        padding: EdgeInsets.all(14.h),
        decoration: AppDecoration.outlineOnErrorContainer.copyWith(
          borderRadius: BorderRadiusStyle.circleBorder28,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 154.adaptSize,
              width: 154.adaptSize,
              child: Stack(
                alignment: Alignment.topRight,
                children: [
                  CustomImageView(
                    imagePath: property['urlThumbnail'],
                    height: 154.adaptSize,
                    width: 154.adaptSize,
                    radius: BorderRadius.circular(
                      20.h,
                    ),
                    alignment: Alignment.center,
                  ),
                  CustomElevatedButton(
                    height: 22.v,
                    width: 100.h,
                    text: property['disewakan']
                        .toString()
                        .split(' ')
                        .map((word) => word.isNotEmpty
                            ? '${word[0].toUpperCase()}${word.substring(1)}'
                            : '')
                        .join(' '),
                    margin: EdgeInsets.only(
                      top: 12.v,
                      right: 12.h,
                    ),
                    buttonTextStyle: theme.textTheme.labelMedium!,
                    alignment: Alignment.topRight,
                  ),
                ],
              ),
            ),
            SizedBox(height: 11.v),
            Text(
              property['namaKontrakan']
                  .split(' ')
                  .map((word) => word.isNotEmpty
                      ? '${word[0].toUpperCase()}${word.substring(1)}'
                      : '')
                  .join(' '),
              style: CustomTextStyles.titleMediumGray9000118_1,
            ),
            SizedBox(height: 12.v),
            Text(
              property['kabupaten'].toString().replaceFirstMapped(
                    RegExp(r'\b\w'),
                    (match) => match.group(0)?.toUpperCase() ?? '',
                  ),
              style: CustomTextStyles.labelMediumGray700,
            ),
            SizedBox(height: 8.v),
            Row(
              children: [
                Text(
                  NumberFormat.currency(
                    locale: 'id_ID',
                    symbol: 'Rp',
                    decimalDigits: 0,
                  ).format(property['hargaPerBulan'] ?? 0),
                  style: CustomTextStyles.titleLargePrimary,
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: 4.h,
                    top: 10.v,
                    bottom: 2.v,
                  ),
                  child: Text(
                    '/ Malam',
                    style: theme.textTheme.bodySmall,
                  ),
                ),
              ],
            ),
          ],
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
              text: username ?? '',
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
      case BottomBarEnum.Search:
        return AppRoutes.searchPage;
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
      case AppRoutes.searchPage:
        return const SearchPage();
      case AppRoutes.homeProfile:
        return const HomeProfile();
      default:
        return const HomePage();
    }
  }
}
