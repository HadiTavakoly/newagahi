import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newagahi/constans.dart';
import 'package:newagahi/screens/ads_register/ads_register_controller.dart';
import 'package:newagahi/screens/ads_register/ads_register_page.dart';
import 'package:newagahi/screens/edite_ads/edite_ads_page.dart';
import 'package:newagahi/screens/my_ads/my_ads_controller.dart';
import '../../bindings/my_binding.dart';
import '../ads_details/ads_details_page.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:intl/intl.dart';

class MyAdsPage extends GetView<MyAdsController> {
  MyAdsPage({super.key});
  final formatter = NumberFormat(
    ',###',
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'آگهی های من',
        ),
      ),
      body: Center(
        child: Obx(
          () => controller.isDataLoading.value
              ? const SpinKitThreeBounce(
                  size: 25,
                  color: Color(0xffC42127),
                  duration: Duration(
                    seconds: 1,
                  ),
                )
              : controller.myAdsData!.data!.isEmpty
                  ? const Text(
                      'شما آگهی ای ندارید',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    )
                  : ListView.separated(
                      cacheExtent: 200,
                      itemCount: controller.myAdsData!.data!.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            Get.to(
                              () => const AdsDetails(),
                              binding: MyBinding(),
                              arguments: Get.find<MyAdsController>()
                                  .myAdsData!
                                  .data![index]
                                  .id,
                            );
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 20),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  height: Get.height / 5,
                                  width: Get.width,
                                  color: Colors.white,
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              controller.myAdsData!.data![index]
                                                  .titleLimit
                                                  .toString(),
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              style: const TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            Text(
                                              controller.myAdsData!.data![index]
                                                  .descriptionLimit
                                                  .toString(),
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                color: Colors.grey[600],
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            const Spacer(),
                                            Text(
                                              controller.myAdsData!.data![index]
                                                          .price ==
                                                      0
                                                  ? 'توافقی'
                                                  : '${formatter.format(controller.myAdsData!.data![index].price)} تومان',
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                fontSize: 15,
                                                color: Colors.grey[600],
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            Text(
                                              '${controller.myAdsData!.data![index].updatedAt} در ${controller.myAdsData!.data![index].state}',
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                fontSize: 15,
                                                color: Colors.grey[600],
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      AspectRatio(
                                        aspectRatio: 1,
                                        child: Container(
                                          width: Get.width / 3,
                                          decoration: BoxDecoration(
                                            color: Colors.grey[200],
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            image: DecorationImage(
                                              image: NetworkImage(
                                                controller.myAdsData!
                                                        .data![index].imageUrl
                                                        .toString()
                                                        .startsWith(
                                                            'https://newagahi.ir')
                                                    ? controller.myAdsData!
                                                        .data![index].imageUrl
                                                        .toString()
                                                    : 'https://newagahi.ir${controller.myAdsData!.data![index].imageUrl.toString()}',
                                              ),
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Get.to(
                                      const EditeAdsPage(),
                                      binding: MyBinding(),
                                      arguments: controller.myAdsData,
                                    );
                                  },
                                  child: Icon(
                                    Icons.edit_outlined,
                                    size: 30,
                                    color: primaryColor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                      separatorBuilder: (context, index) {
                        return const Divider(
                          thickness: 1,
                          height: 0,
                          indent: 8,
                          endIndent: 8,
                        );
                      },
                    ),
        ),
      ),
    );
  }
}
