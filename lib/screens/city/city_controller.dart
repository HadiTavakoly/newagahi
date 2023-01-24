import 'package:get/get.dart';
import '../../models/city_model.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class CityController extends GetxController {
  City? cityData;
  var flag = Get.arguments[0].toString();
  var stateId = Get.arguments[1] ?? 3;
  var stateName = Get.arguments[2] ?? '';
  var isDataLoading = false.obs;

  @override
  Future<void> onInit() async {
    super.onInit();
    getCity(stateId);
  }

  getCity(int id) async {
    try {
      isDataLoading(true);
      var respons = await http.get(
        Uri.https(
          'newagahi.ir',
          'api/v1/state/$id',
        ),
      );

      if (respons.statusCode == 200) {
        cityData = City.fromJson(jsonDecode(respons.body));
      } else {
        isDataLoading(false);
        throw Exception('Fail to load city');
      }
    } catch (e) {
      throw Exception('Error : $e');
    } finally {
      isDataLoading(false);
    }
  }
}
