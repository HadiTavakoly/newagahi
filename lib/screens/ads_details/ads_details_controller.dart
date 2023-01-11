import 'package:get/get.dart';
import '../../models/ads_model.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class AdsDetailsController extends GetxController {
  var id = Get.arguments;
  Ads? adsDetailsData;
  var isDataLoading = false.obs;

  @override
  Future<void> onInit() async {
    super.onInit();
    getAdsDetails(id);
  }

  @override
  Future<void> onReady() async {
    super.onReady();
  }

  @override
  void onClose() async {
    super.onClose();
  }

  getAdsDetails(int id) async {
    try {
      isDataLoading(true);
      var respons = await http.get(
        Uri.https(
          'newagahi.ir',
          'api/v1/ads/$id',
        ),
      );

      if (respons.statusCode == 200) {
        adsDetailsData = Ads.fromJson(jsonDecode(respons.body));
        // FlutterNativeSplash.remove();

      } else {
        isDataLoading(false);
        throw Exception('Fail to load last ads details');
      }
    } catch (e) {
      throw Exception('Fail to load last ads details $e');
    } finally {
      isDataLoading(false);
    }
  }
}
