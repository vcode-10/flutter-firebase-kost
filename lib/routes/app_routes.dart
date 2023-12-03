import 'package:projectkost/pages/active_property.dart';
import 'package:projectkost/pages/home_page.dart';
import 'package:projectkost/pages/home_profile.dart';

import 'package:get/get.dart';
import 'package:projectkost/pages/search_page.dart';

class AppRoutes {
  static const String homeProfile = '/profile';
  static const String homePage = '/home';
  static const String searchPage = '/search';
  static const String activityPage = '/activity';

  static List<GetPage> pages = [
    GetPage(name: homeProfile, page: () => const HomeProfile()),
    GetPage(name: homePage, page: () => const HomePage()),
    GetPage(name: searchPage, page: () => const SearchPage()),
    GetPage(name: activityPage, page: () => const ActiveProperty()),
  ];
}
