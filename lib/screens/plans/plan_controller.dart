import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../../models/plan_model.dart';

class PlanController extends GetxController {
  Plan? planData;
  var isDataLoading = false.obs;
  
  @override
  Future<void> onInit() async {
    super.onInit();
    getPlans();
  }

  getPlans() async {
    try {
      isDataLoading(true);
      var response = await http.get(
        Uri.https(
          'newagahi.ir',
          'api/v1/plans',
        ),
      );

      if (response.statusCode == 200) {
        planData = Plan.fromJson(jsonDecode(response.body));
      } else {
        isDataLoading(false);
        throw Exception('Fail to load plans');
      }
    } catch (e) {
      throw Exception('Fail to load plans');
    } finally {
      isDataLoading(false);
    }
  }
}
