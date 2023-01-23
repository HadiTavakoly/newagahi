import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import './category_controller.dart';
import '../../constans.dart';
import '../subcategory/subcategory_page.dart';
import '../../bindings/my_binding.dart';
import '../ads_register/ads_register_controller.dart';

class CategoryPage extends StatelessWidget {
  const CategoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'دسته بندی آگهی ها',
        ),
      ),
      body: Center(
        child: Obx(
          () => Get.find<CategoryController>().isDataLoading.value
              ? const SpinKitThreeBounce(
                  size: 25,
                  color: Color(0xffC42127),
                  duration: Duration(
                    seconds: 1,
                  ),
                )
              : Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: ListView.separated(
                    itemCount: Get.find<CategoryController>()
                        .categoriesData!
                        .data!
                        .length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          Get.find<AdsRegisterController>().categoryName.value =
                              Get.find<CategoryController>()
                                      .categoriesData!
                                      .data![index]
                                      .name ??
                                  '';

                          // Get.find<SearchController>().categoryName.value =
                          //     Get.find<CategoryController>()
                          //             .categoriesData!
                          //             .data![index]
                          //             .name ??
                          //         '';

                          // Get.find<SearchController>().categoryId.value =
                          //     Get.find<CategoryController>()
                          //             .categoriesData!
                          //             .data![index]
                          //             .id ??
                          //         0;
                          Get.to(
                            () => const SubCategory(),
                            binding: MyBinding(),
                            arguments: [
                              Get.find<CategoryController>()
                                  .categoriesData!
                                  .data![index]
                                  .id,
                              Get.find<CategoryController>()
                                  .categoriesData!
                                  .data![index]
                                  .name
                            ],
                          );
                        },
                        child: ListTile(
                          horizontalTitleGap: 0,
                          contentPadding:
                              const EdgeInsets.symmetric(horizontal: 0),
                          title: Text(
                            Get.find<CategoryController>()
                                .categoriesData!
                                .data![index]
                                .name
                                .toString(),
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          leading: Icon(
                            getIcon(
                              Get.find<CategoryController>()
                                  .categoriesData!
                                  .data![index]
                                  .icon
                                  .toString(),
                            ),
                            size: 20,
                          ),
                          trailing: const Icon(
                            Icons.arrow_back_ios_new_rounded,
                            size: 15,
                          ),
                        ),
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
