import 'package:get/get.dart';
import 'package:newagahi/screens/edite_ads/edite_ads_controller.dart';
import 'package:newagahi/screens/profile/profile_controller.dart';
import '../screens/category/category_controller.dart';
import '../screens/home/ads_controller.dart';
import '../screens/ads_details/ads_details_controller.dart';
import '../screens/subcategory/subcategory_controller.dart';
import '../screens/state/state_controller.dart';
import '../screens/city/city_controller.dart';
import '../screens/home/home_controller.dart';
import '../screens/dashbord/dashbord_controller.dart';
import '../screens/splash/auth_controller.dart';
import '../screens/login/login_controller.dart';
import '../screens/ads_register/ads_register_controller.dart';
import '../screens/plans/plan_controller.dart';
import '../screens/register/register_controller.dart';
import '../screens/splash/splash_controller.dart';
import '../screens/my_ads/my_ads_controller.dart';

class MyBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(SplashController());
    Get.put(CategoryController());
    Get.lazyPut(() => SubCategoryController());
    // Get.put(AdsController(),);
    Get.lazyPut(
      () => AdsController(),
    );
    Get.lazyPut(() => AdsDetailsController());
    Get.lazyPut(() => StateController());
    Get.lazyPut(() => CityController());
    Get.lazyPut(() => HomeController());
    Get.lazyPut(() => DashbordController());
    Get.lazyPut(() => AuthController());
    Get.lazyPut(() => LoginController());
    Get.lazyPut(() => AdsRegisterController());
    Get.lazyPut(() => EditeAdsController());
    Get.lazyPut(() => PlanController());
    Get.lazyPut(
      () => RegisterController(),
      fenix: true,
    );
    Get.lazyPut(
      () => MyAdsController(),
      fenix: true,
    );
    Get.lazyPut(() => ProfileController());
  }
}
