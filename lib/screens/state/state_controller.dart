import 'package:get/get.dart';
import '../../models/state_model.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class StateController extends GetxController {
  State? stateData;
  var isDataLoading = false.obs;

  @override
  Future<void> onInit() async {
    getState();
    super.onInit();
  }

  getState() async {
    try {
      isDataLoading(true);
      var respons = await http.get(
        Uri.https(
          'newagahi.ir',
          'api/v1/states',
        ),
      );

      if (respons.statusCode == 200) {
        stateData = State.fromJson(jsonDecode(respons.body));
      } else {
        isDataLoading(false);
        throw Exception('Fail to load states');
      }
    } catch (e) {
      throw Exception('Error : $e');
    } finally {
      isDataLoading(false);
    }
  }
}
