import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:newagahi/constans.dart';
import 'package:newagahi/screens/city/select_city_page.dart';
import 'package:newagahi/screens/search/search_controller.dart';
import 'state_controller.dart';
import '../../bindings/my_binding.dart';

class SelectStatePage extends StatelessWidget {
  const SelectStatePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'انتخاب استان',
          // Get.arguments.toString(),
        ),
      ),
      body: Center(
        child: Obx(() => Get.find<StateController>().isDataLoading.value
            ? SpinKitThreeBounce(
                size: 25,
                color: primaryColor,
                duration: const Duration(
                  seconds: 1,
                ),
              )
            : ListView.separated(
                itemCount: Get.find<StateController>().stateData!.data!.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    onTap: () {
                      // Get.find<StateController>().stateId.value =
                      //     Get.find<StateController>()
                      //             .stateData!
                      //             .data![index]
                      //             .id ??
                      //         0;

                      // Get.find<StateController>().stateId.value =
                      //     Get.find<StateController>()
                      //             .stateData!
                      //             .data![index]
                      //             .id ??
                      //         0;

                      Get.find<SearchController>().query['stateId'] =
                          Get.find<StateController>()
                              .stateData!
                              .data![index]
                              .id
                              .toString();

                      Get.find<StateController>().stateName.value =
                          Get.find<StateController>()
                                  .stateData!
                                  .data![index]
                                  .stateName ??
                              '';
                      Get.to(
                        () => const SelectCityPage(),
                        arguments: Get.find<StateController>()
                            .stateData!
                            .data![index]
                            .id,
                        binding: MyBinding(),
                      );
                    },
                    contentPadding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                    title: Text(
                      Get.find<StateController>()
                          .stateData!
                          .data![index]
                          .stateName
                          .toString(),
                    ),
                    trailing: const Icon(
                      Icons.arrow_back_ios_new_rounded,
                      size: 15,
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return Divider(
                    thickness: 1,
                    height: 0,
                    indent: 15,
                    endIndent: 15,
                    color: Colors.grey.shade200,
                  );
                },
              )),
      ),
    );
  }
}
