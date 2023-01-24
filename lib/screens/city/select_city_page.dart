import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:newagahi/bindings/my_binding.dart';
import 'package:newagahi/constans.dart';
import 'package:newagahi/screens/home/home_controller.dart';
import 'package:newagahi/screens/search/search_page.dart';
import 'package:newagahi/screens/state/state_controller.dart';
import '../ads_register/ads_register_controller.dart';
import '../search/search_controller.dart';
import 'city_controller.dart';

class SelectCityPage extends GetView<CityController> {
  const SelectCityPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'انتخاب شهر',
          // controller.flag.toString(),
          // controller.id.toString(),
          // controller.cityId.toString(),
          // controller.cityName.value.toString(),
        ),
      ),
      body: Center(
        child: Obx(
          () => Get.find<CityController>().isDataLoading.value
              ? SpinKitThreeBounce(
                  size: 25,
                  color: primaryColor,
                  duration: const Duration(
                    seconds: 1,
                  ),
                )
              : ListView.separated(
                  itemCount: Get.find<CityController>().cityData!.data!.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 20),
                      title: Text(
                        Get.find<CityController>()
                            .cityData!
                            .data![index]
                            .cityName
                            .toString(),
                      ),
                      onTap: () {
                        if (controller.flag.toString() == 'false') {
                          Get.find<AdsRegisterController>().cityId.value =
                              controller.cityData!.data![index].id ?? 3;
                          Get.find<AdsRegisterController>().cityName.value =
                              controller.cityData!.data![index].cityName ?? '';

                          Get.back();
                          Get.back();
                        } else {
                          Get.to(
                            () => SearchPage(),
                            arguments: [
                              '',
                              '',
                              controller.stateId.toString(),
                              controller.stateName.toString(),
                              controller.cityData!.data![index].id ?? 3,
                              controller.cityData!.data![index].cityName ?? ''
                            ],
                            binding: MyBinding(),
                          );
                        }
                      },
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
                ),
        ),
      ),
    );
  }
}
