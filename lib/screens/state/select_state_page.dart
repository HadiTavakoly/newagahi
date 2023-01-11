import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:newagahi/screens/city/select_city_page.dart';
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
        ),
      ),
      body: Center(
        child: Obx(() => Get.find<StateController>().isDataLoading.value
            ? const SpinKitThreeBounce(
                size: 25,
                color: Color(0xffC42127),
                duration: Duration(
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
                      print(Get.find<StateController>()
                          .stateData!
                          .data![index]
                          .id);
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
      // bottomNavigationBar: Container(
      //   color: Colors.grey[100],
      //   padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      //   height: Get.height / 12,
      //   child: ElevatedButton(
      //     style: ElevatedButton.styleFrom(
      //       backgroundColor: const Color(0xffC42127),
      //       elevation: 0,
      //     ),
      //     onPressed: () {},
      //     child: const Text(
      //       'تایید',
      //       style: TextStyle(
      //         fontSize: 20,
      //         fontWeight: FontWeight.bold,
      //       ),
      //     ),
      //   ),
      // ),
    );
  }
}
