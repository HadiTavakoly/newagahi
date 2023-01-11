import 'package:get/get.dart';
import 'package:newagahi/screens/splash/auth_controller.dart';
import '../../models/ads_model.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class MyAdsController extends GetxController {
  Ads? myAdsData;
  var isDataLoading = false.obs;
  Map<String, String> queryParameters = {
    'api_token': Get.find<AuthController>().getToken().toString(),
  };

  @override
  Future<void> onInit() async {
    super.onInit();
    getMyAds();
  }

  getMyAds() async {
    try {
      isDataLoading(true);
      var respons = await http.get(
        Uri.https('newagahi.ir', 'api/v1/panel/my-ads', queryParameters),
      );

      if (respons.statusCode == 200) {
        myAdsData = Ads.fromJson(jsonDecode(respons.body));
      } else {
        isDataLoading(false);
        throw Exception('Fail to load my ads');
      }
    } catch (e) {
      throw Exception('Fail to load my ads');
    } finally {
      isDataLoading(false);
    }
  }
}
