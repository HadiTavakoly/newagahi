import 'package:get/get.dart';
import '../../models/categories_model.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class SubCategoryController extends GetxController {
  Category? subCategoriesData;
  var isDataLoading = false.obs;
  int id = Get.arguments[0];
  String name = Get.arguments[1];

  @override
  Future<void> onInit() async {
    super.onInit();
    getCategories(id);
  }

  getCategories(int id) async {
    try {
      isDataLoading(true);
      var respons = await http.get(
        Uri.https(
          'newagahi.ir',
          'api/v1/categories/$id',
        ),
      );

      if (respons.statusCode == 200) {
        subCategoriesData = Category.fromJson(jsonDecode(respons.body));
      } else {
        isDataLoading(false);
        throw Exception('Fail to load subCategories');
      }
    } catch (e) {
      throw Exception('Error : $e');
    } finally {
      isDataLoading(false);
    }
  }
}
