import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:newagahi/screens/ads_register/ads_register_controller.dart';
import 'package:newagahi/screens/ads_register/ads_register_page.dart';
import 'subcategory_controller.dart';
import '../dashbord/dashbord_controller.dart';

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
                        // trailing: const Icon(
                        //   Icons.arrow_back_ios_new_rounded,
                        //   size: 15,
                        // ),
                        onTap: () {
                          Get.find<AdsRegisterController>().categoryId.value =
                              Get.find<SubCategoryController>()
                                      .subCategoriesData!
                                      .data![index]
                                      .id ??
                                  0;



                          Get.find<AdsRegisterController>().subCategoryName.value =
                              Get.find<SubCategoryController>()
                                      .subCategoriesData!
                                      .data![index]
                                      .name ??
                                  '';
                          Get.back();
                          Get.back();
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
