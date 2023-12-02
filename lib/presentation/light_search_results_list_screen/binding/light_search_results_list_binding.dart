import '../controller/light_search_results_list_controller.dart';
import 'package:get/get.dart';

/// A binding class for the LightSearchResultsListScreen.
///
/// This class ensures that the LightSearchResultsListController is created when the
/// LightSearchResultsListScreen is first loaded.
class LightSearchResultsListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LightSearchResultsListController());
  }
}
