import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:newagahi/bindings/my_binding.dart';
import 'package:newagahi/constans.dart';
import 'package:newagahi/screens/ads_register/ads_register_controller.dart';
import 'package:newagahi/screens/search/search_page.dart';
import '../search/search_controller.dart';
import 'subcategory_controller.dart';

class SubCategory extends StatelessWidget {
  const SubCategory({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.grey[600]),
        backgroundColor: Colors.grey[50],
        elevation: 0.5,
        title: Text(
          Get.find<SubCategoryController>().name.toString(),
        ),
      ),
      body: Center(
        child: Obx(
          () => Get.find<SubCategoryController>().isDataLoading.value
              ? SpinKitThreeBounce(
                  size: 25,
                  color: primaryColor,
                  duration: const Duration(
                    seconds: 1,
                  ),
                )
              : Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: ListView.separated(
                    itemCount: Get.find<SubCategoryController>()
                        .subCategoriesData!
                        .data!
                        .length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        horizontalTitleGap: 0,
                        contentPadding:
                            const EdgeInsets.symmetric(horizontal: 0),
                        title: Text(
                          Get.find<SubCategoryController>()
                              .subCategoriesData!
                              .data![index]
                              .name
                              .toString(),
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        onTap: () {
                          if (Get.find<SubCategoryController>()
                                  .flag
                                  .toString() ==
                              'false') {
                            Get.find<AdsRegisterController>().categoryId.value =
                                Get.find<SubCategoryController>()
                                        .subCategoriesData!
                                        .data![index]
                                        .id ??
                                    0;

                            Get.find<AdsRegisterController>()
                                .subCategoryName
                                .value = Get.find<SubCategoryController>()
                                    .subCategoriesData!
                                    .data![index]
                                    .name ??
                                '';
                            Get.back();
                            Get.back();
                          } else {
                            Get.to(
                              () => SearchPage(),
                              arguments: [
                                Get.find<SubCategoryController>()
                                    .subCategoriesData!
                                    .data![index]
                                    .id
                                    .toString(),
                                Get.find<SubCategoryController>()
                                        .subCategoriesData!
                                        .data![index]
                                        .name ??
                                    '',
                                '',
                                '',
                                '',
                                '',
                              ],
                              binding: MyBinding(),
                            );
                          }

                          // Get.find<SearchController>().subCategoryName.value =
                          //     Get.find<SubCategoryController>()
                          //             .subCategoriesData!
                          //             .data![index]
                          //             .name ??
                          //         '';

                          // Get.find<SearchController>().query['subCategoryId'] =
                          //     Get.find<SubCategoryController>()
                          //         .subCategoriesData!
                          //         .data![index]
                          //         .id
                          //         .toString();
                        },
                      );
                    },
                    separatorBuilder: (context, index) {
                      return Divider(
                        height: 0,
                        color: Colors.grey.withOpacity(0.5),
                      );
                    },
                  ),
                ),
        ),
      ),
    );
  }
}
