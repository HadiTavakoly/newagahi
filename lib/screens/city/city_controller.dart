import 'package:get/get.dart';
import '../../models/city_model.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class CityController extends GetxController {
  City? cityData;
  // int? id;
  var id = Get.arguments;
  var isDataLoading = false.obs;
  // var cityId = 0.obs;
  var cityName = ''.obs;

  @override
  Future<void> onInit() async {
    // print('args:$id');
    super.onInit();

    getCity(id);
  }

  // @override
  // Future<void> onReady() async {
  //   final id = Get.arguments;
  //   if (id != 0) {
  //     getState(id);
  //   }
  //   super.onReady();
  // }

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
      throw Exception('Fail to load city');
    } finally {
      isDataLoading(false);
    }
  }
}
