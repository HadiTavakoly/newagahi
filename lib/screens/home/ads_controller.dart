import 'package:get/get.dart';
import '../../models/ads_model.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class AdsController extends GetxController {
  Ads? adsData;
  var isDataLoading = false.obs;

  @override
  Future<void> onInit() async {
    super.onInit();
    getAds();
  }

  getAds() async {
    try {
      isDataLoading(true);
      var respons = await http.get(
        Uri.https(
          'newagahi.ir',
          'api/v1/ads',
        ),
      );

      if (respons.statusCode == 200) {
        adsData = Ads.fromJson(jsonDecode(respons.body));

      } else {
        isDataLoading(false);
        throw Exception('Fail to load last ads');
      }
    } catch (e) {
      throw Exception('Fail to load last ads');
    } finally {
      isDataLoading(false);
    }
  }
}
