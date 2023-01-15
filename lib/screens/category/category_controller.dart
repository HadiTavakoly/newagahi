import 'package:get/get.dart';
import '../../models/categories_model.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class CategoryController extends GetxController {
  Category? categoriesData;
  var isDataLoading = false.obs;

  @override
  Future<void> onInit() async {
    super.onInit();
    getCategories();
  }

  getCategories() async {
    try {
      isDataLoading(true);
      var respons = await http.get(
        Uri.https(
          'newagahi.ir',
          'api/v1/categories',
        ),
      );

      if (respons.statusCode == 200) {
        categoriesData = Category.fromJson(jsonDecode(respons.body));
      } else {
        isDataLoading(false);
        throw Exception('Fail to load categories');
      }
    } catch (e) {
      throw Exception('Error : $e');
    } finally {
      isDataLoading(false);
    }
  }
}
