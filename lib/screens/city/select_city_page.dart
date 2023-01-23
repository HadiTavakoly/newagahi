import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:newagahi/constans.dart';
import 'package:newagahi/screens/home/home_controller.dart';
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
        title: const Text(
          'انتخاب شهر',
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
                        // Get.find<HomeController>().cityName.value
                        Get.find<CityController>().cityName.value =
                            controller.cityData!.data![index].cityName ?? '';

                        Get.find<CityController>().cityId.value =
                            controller.cityData!.data![index].id ?? 0;
                        Get.find<SearchController>().query['cityId'] =
                            controller.cityData!.data![index].id.toString();

                        Get.back();
                        Get.back();
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
