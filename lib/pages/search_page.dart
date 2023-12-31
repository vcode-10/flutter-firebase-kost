import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:projectkost/core/app_export.dart';
import 'package:projectkost/pages/auth_checker.dart';
import 'package:projectkost/pages/home_page.dart';
import 'package:projectkost/pages/home_profile.dart';
import 'package:projectkost/pages/property_page.dart';
import 'package:projectkost/widgets/app_bar/appbar_leading_image.dart';
import 'package:projectkost/widgets/app_bar/appbar_title_edittext_one.dart';
import 'package:projectkost/widgets/app_bar/custom_app_bar.dart';
import 'package:projectkost/widgets/custom_bottom_bar.dart';
import 'package:projectkost/widgets/custom_elevated_button.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController searchController = TextEditingController();
  DatabaseReference db_Ref =
      FirebaseDatabase.instance.ref().child('properties');
  late Query query;

  @override
  void initState() {
    super.initState();
    // Initialize query with the initial state
    query = db_Ref;
  }

  void updateQuery() {
    setState(() {
      String searchTerm = searchController.text.toLowerCase();

      query = searchTerm.isNotEmpty
          ? db_Ref
              .orderByChild('kabupaten')
              .startAt(searchTerm)
              .endAt(searchTerm + '\uf8ff')
          : db_Ref;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AuthChecker(
        child: SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
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
                  FirebaseAnimatedList(
                    query: query,
                    shrinkWrap: true,
                    itemBuilder: (context, snapshot, animation, index) {
                      Map dataArray = snapshot.value as Map;
                      dataArray['key'] = snapshot.key;
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 16.0),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => PropertyPage(
                                  property_key: dataArray['key'],
                                ),
                              ),
                            );
                          },
                          child: Container(
                            padding: EdgeInsets.all(14.h),
                            decoration:
                                AppDecoration.outlineOnErrorContainer.copyWith(
                              borderRadius: BorderRadiusStyle.circleBorder28,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  height: 120.adaptSize,
                                  width: 120.adaptSize,
                                  child: Stack(
                                    alignment: Alignment.topRight,
                                    children: [
                                      CustomImageView(
                                        imagePath: dataArray['urlThumbnail'],
                                        height: 120.adaptSize,
                                        width: 120.adaptSize,
                                        radius: BorderRadius.circular(
                                          20.h,
                                        ),
                                        alignment: Alignment.center,
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                    left: 16.h,
                                    top: 19.v,
                                    bottom: 19.v,
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        width: 110.h,
                                        child: Text(
                                          dataArray['namaKontrakan']
                                              .split(' ')
                                              .map((word) => word.isNotEmpty
                                                  ? '${word[0].toUpperCase()}${word.substring(1)}'
                                                  : '')
                                              .join(' '),
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                          style: CustomTextStyles
                                              .titleLargeGray90001
                                              .copyWith(
                                            height: 1.20,
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: 10.v),
                                      Text(
                                        dataArray['kabupaten']
                                            .toString()
                                            .replaceFirstMapped(
                                              RegExp(r'\b\w'),
                                              (match) =>
                                                  match
                                                      .group(0)
                                                      ?.toUpperCase() ??
                                                  '',
                                            ),
                                        style:
                                            CustomTextStyles.bodyMediumGray700,
                                      ),
                                    ],
                                  ),
                                ),
                                const Spacer(),
                                Padding(
                                  padding: EdgeInsets.only(
                                    top: 14.v,
                                    right: 4.h,
                                    bottom: 14.v,
                                  ),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      CustomElevatedButton(
                                        height: 25.v,
                                        width: 120.h,
                                        text: dataArray['disewakan']
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
                                      ),
                                      SizedBox(height: 24.v),
                                      Text(
                                        NumberFormat.currency(
                                          locale: 'id_ID',
                                          symbol: 'Rp',
                                          decimalDigits: 0,
                                        ).format(
                                            dataArray['hargaPerBulan'] ?? 0),
                                        style: CustomTextStyles
                                            .headlineSmallPrimary,
                                      ),

                                      SizedBox(height: 5.v),
                                      // Obx(
                                      //   () => Text(
                                      //     currentItem.night!.value,
                                      //     style: theme.textTheme.bodySmall,
                                      //   ),
                                      // ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
        bottomNavigationBar: _buildBottomBar(),
      ),
    ));
  }

  // /// Section Widget
  PreferredSizeWidget _buildAppBar() {
    return CustomAppBar(
      leadingWidth: 52.h,
      title: Container(
        margin: EdgeInsets.zero, // You can adjust the margin as needed
        child: Row(
          children: [
            Container(
              margin: EdgeInsets.fromLTRB(20.h, 18.v, 12.h, 18.v),
              child: CustomImageView(
                imagePath: ImageConstant.imgSearch,
                height: 20.adaptSize,
                width: 20.adaptSize,
              ),
            ),
            Expanded(
              child: TextField(
                controller: searchController,
                decoration: InputDecoration(
                  hintText: "Search".tr,
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(vertical: 18.v),
                ),
                onSubmitted: (String value) {
                  // Update the query when the user submits the search
                  updateQuery();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBottomBar() {
    return CustomBottomBar(
      onChanged: (BottomBarEnum type) {
        navigateToPage(type);
      },
      selectedIndex: 1.obs,
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
        return AppRoutes.homeProfile;
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
        return const HomeProfile();
    }
  }
}
