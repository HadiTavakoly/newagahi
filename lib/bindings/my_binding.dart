import 'package:get/get.dart';
import 'package:newagahi/screens/profile/profile_controller.dart';
import 'package:newagahi/screens/setting/setting_controller.dart';
import '../screens/category/category_controller.dart';
import '../screens/ads_details/ads_details_controller.dart';
import '../screens/my_favorite_ads/my_favorite_ads_controller.dart';
import '../screens/search/search_controller.dart';
import '../screens/subcategory/subcategory_controller.dart';
import '../screens/state/state_controller.dart';
import '../screens/city/city_controller.dart';
import '../screens/home/home_controller.dart';
import '../screens/dashbord/dashbord_controller.dart';
import '../screens/dashbord/auth_controller.dart';
import '../screens/login/login_controller.dart';
import '../screens/ads_register/ads_register_controller.dart';
import '../screens/plans/plan_controller.dart';
import '../screens/register/register_controller.dart';
import '../screens/my_ads/my_ads_controller.dart';

class MyBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CategoryController());
    Get.lazyPut(() => SubCategoryController());
    Get.lazyPut(() => AdsDetailsController());
    Get.lazyPut(() => StateController());
    Get.lazyPut(() => CityController());
    Get.lazyPut(() => HomeController());
    Get.lazyPut(() => DashbordController());
    Get.lazyPut(() => AuthController());
    Get.lazyPut(() => LoginController());
    Get.lazyPut(() => AdsRegisterController(), );
    Get.lazyPut(() => PlanController());
    Get.lazyPut(() => RegisterController());
    Get.lazyPut(() => MyAdsController(),);
    Get.lazyPut(() => ProfileController());
    Get.lazyPut(() => MyFavoriteAdsController());
    Get.lazyPut(() => SettingController());
    Get.lazyPut(() => SearchController());
  }
}
