import 'package:get/get.dart';
import 'package:newagahi/screens/dashbord/auth_controller.dart';
import '../../models/ads_model.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class SettingController extends GetxController {
  Ads? myFavoriteAdsData;
  var isDataLoading = false.obs;
  Map<String, String> queryParameters = {
    'api_token': Get.find<AuthController>().getToken().toString(),
  };

  @override
  Future<void> onInit() async {
    super.onInit();
    getMyFavoriteAds();
  }

  getMyFavoriteAds() async {
    try {
      isDataLoading(true);
      var respons = await http.get(
        Uri.https(
          'newagahi.ir',
          'api/v1/panel/ads/favorites',
          queryParameters,
        ),
      );
      if (respons.statusCode == 200) {
        myFavoriteAdsData = Ads.fromJson(jsonDecode(respons.body));
      } else {
        isDataLoading(false);
        throw Exception('Fail to load my favorite ads');
      }
    } catch (e) {
      throw Exception('Error : $e');
    } finally {
      isDataLoading(false);
    }
  }
}
