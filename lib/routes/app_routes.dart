import 'package:projectkost/pages/home_page.dart';
import 'package:projectkost/pages/home_profile.dart';

import 'package:get/get.dart';

class AppRoutes {
  static const String homeProfile = '/profile';
  static const String homePage = '/home';
  static const String explorePage = '/explore';
  static const String favoritesPage = '/favorites';
  static const String messagePage = '/message';

  static List<GetPage> pages = [
    GetPage(name: homeProfile, page: () => HomeProfile()),
    GetPage(name: homePage, page: () => HomePage()),
    // GetPage(name: explorePage, page: () => ExplorePage()),
    // GetPage(name: favoritesPage, page: () => FavoritesPage()),
    // GetPage(name: messagePage, page: () => MessagePage()),
  ];
}
