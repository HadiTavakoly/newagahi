import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:newagahi/bindings/my_binding.dart';
import 'package:newagahi/screens/ads_details/ads_details_page.dart';
import 'package:newagahi/screens/city/city_controller.dart';
import 'package:newagahi/screens/city/select_city_page.dart';
import 'package:newagahi/screens/home/home_controller.dart';
import 'package:newagahi/screens/search/search_controller.dart';
import 'package:newagahi/screens/state/state_controller.dart';
import '../category/category_controller.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../category/category_page.dart';
import '../subcategory/subcategory_controller.dart';
import '../subcategory/subcategory_page.dart';
import '../state/select_state_page.dart';
import '../../constans.dart';

class SearchPage extends StatelessWidget {
  SearchPage({super.key});
  var controller = Get.find<SearchController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        titleSpacing: 10,
        centerTitle: true,
        title: TextField(
          // autofocus: true,
          cursorColor: primaryColor,
          maxLines: 1,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.all(5),
            prefixIcon: const Icon(
              Icons.search_rounded,
              color: Colors.grey,
            ),
            fillColor: Colors.white,
            filled: true,
            hintText: 'جستجو در همه آگهی ها',
            hintStyle: const TextStyle(
              color: Colors.grey,
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.grey.withOpacity(0.5),
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.grey.withOpacity(0.5),
              ),
            ),
            // suffix: Container(
            //   color: Colors.red,
            //   child: GestureDetector(
            //     onTap: () {
            //       Get.to(const SelectStatePage(),
            //           binding: MyBinding(), arguments: 1);
            //     },
            //     child: Row(
            //       mainAxisAlignment: MainAxisAlignment.center,
            //       crossAxisAlignment: CrossAxisAlignment.center,
            //       children: [
            //         Obx(
            //           () => Text(
            //             Get.find<SearchController>().cityName.value == ''
            //                 ? 'همه شهر ها'
            //                 : Get.find<SearchController>().cityName.value,
            //           ),
            //         ),
            //         const SizedBox(
            //           width: 5,
            //         ),
            //         const Icon(
            //           Icons.location_on_outlined,
            //           color: Colors.grey,
            //         ),
            //       ],
            //     ),
            //   ),
            // ),
          ),
          onChanged: (String value) {
            // controller.search.value = value;
            controller.query['search'] = value;
            // Get.find<SearchController>().getFiltredAds();
          },
        ),
        // Container(
        //   padding: const EdgeInsets.all(4),
        //   width: Get.width,
        //   decoration: BoxDecoration(
        //     color: Colors.white,
        //     border: Border.all(color: Colors.grey.withOpacity(0.5)),
        //     borderRadius: BorderRadius.circular(10),
        //   ),
        //   child: IntrinsicHeight(
        //     child: Row(
        //       mainAxisAlignment: MainAxisAlignment.center,
        //       children: [
        //         Row(
        //           mainAxisAlignment: MainAxisAlignment.center,
        //           crossAxisAlignment: CrossAxisAlignment.center,
        //           children: const [
        //             Icon(
        //               Icons.search,
        //               color: Colors.grey,
        //             ),
        //             SizedBox(
        //               width: 10,
        //             ),
        //             TextField(
        //               // Get.find<HomeController>().list.length.toString(),
        //               decoration: InputDecoration(
        //                 hintText: 'جستجو در همه آگهی ها',
        //               ),
        //               style: TextStyle(
        //                 color: Colors.grey,
        //               ),
        //             ),
        //           ],
        //         ),
        //         const Spacer(),
        //         VerticalDivider(
        //           width: 20,
        //           thickness: 1,
        //           color: Colors.grey.withOpacity(0.5),
        //         ),
        //         GestureDetector(
        //           onTap: () {
        //             Get.to(const SelectStatePage(),
        //                 binding: MyBinding(), arguments: 1);
        //           },
        //           child: Row(
        //             mainAxisAlignment: MainAxisAlignment.center,
        //             crossAxisAlignment: CrossAxisAlignment.center,
        //             children: [
        //               Obx(
        //                 () => Text(
        //                   Get.find<SearchController>().cityName.value == ''
        //                       ? 'همه شهر ها'
        //                       : Get.find<SearchController>().cityName.value,
        //                 ),
        //               ),
        //               const SizedBox(
        //                 width: 5,
        //               ),
        //               const Icon(
        //                 Icons.location_on_outlined,
        //                 color: Colors.grey,
        //               ),
        //             ],
        //           ),
        //         ),
        //       ],
        //     ),
        //   ),
        // ),
        bottom: PreferredSize(
          preferredSize: Size(
            Get.width,
            45,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Obx(
                  // () => Text(controller.subCategoryName.value),
                  // () => Text(
                  // Get.find<SubCategoryController>().name.toString(),
                  // ),
                  // ),
                  // Category*
                  GestureDetector(
                    child: Chip(
                      label: Obx(
                        () => Text(
                          controller.query['subCategoryId'] == '0' ||
                                  controller.query['subCategoryId'] == ''
                              ? 'دسته بندی'
                              : controller.subCategoryName,
                          style: TextStyle(
                            color: primaryColor,
                          ),
                        ),
                      ),
                      onDeleted: () {
                        controller.query['subCategoryId'] = '';
                        controller.subCategoryName = '';
                      },
                      backgroundColor: primaryColor.withOpacity(0.2),
                      side: BorderSide(color: primaryColor),
                    ),
                    onTap: () {
                      Get.back();
                      Get.back();
                    },
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  //State*
                  // GestureDetector(
                  //   child: Chip(
                  //     label: Obx(
                  //       () => Text(
                  //         Get.find<StateController>().stateName.value == '0' ||
                  //                 Get.find<StateController>().stateName.value ==
                  //                     ''
                  //             ? 'انتخاب استان'
                  //             : Get.find<StateController>().stateName.value,
                  //         style: TextStyle(
                  //           color: primaryColor,
                  //         ),
                  //       ),
                  //     ),
                  //     onDeleted: () {
                  //       controller.query['stateId'] = ' ';
                  //       Get.find<StateController>().stateName.value = '';
                  //     },
                  //     backgroundColor: primaryColor.withOpacity(0.2),
                  //     side: BorderSide(color: primaryColor),
                  //   ),
                  //   onTap: () {
                  //     Get.to(
                  //       () => const SelectStatePage(),
                  //       binding: MyBinding(),
                  //     );
                  //   },
                  // ),
                  const SizedBox(
                    width: 5,
                  ),
                  //City*
                  // GestureDetector(
                  //   child: Chip(
                  //     label: Obx(() => Text(
                  //           controller.query['cityId'] == '0' ||
                  //                   controller.query['cityId'] == ''
                  //               ? 'انتخاب شهر'
                  //               : Get.find<CityController>().cityName.value,
                  //           style: TextStyle(
                  //             color: primaryColor,
                  //           ),
                  //         )),
                  //     onDeleted: () {
                  //       controller.query['cityId'] = '0';
                  //       // Get.find<CityController>().cityName.value = '';
                  //     },
                  //     backgroundColor: primaryColor.withOpacity(0.2),
                  //     side: BorderSide(color: primaryColor),
                  //   ),
                  //   onTap: () {
                  //     Get.to(
                  //       () => const SelectStatePage(),
                  //       binding: MyBinding(),
                  //     );
                  //   },
                  // ),
                ],
              ),
            ),
          ),
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
              : controller.searchData!.data!.isEmpty
                  ? const Text('موردی یافت نشد')
                  : ListView.separated(
                      // controller: controller,
                      itemCount: controller.searchData!.data!.length,
                      // cacheExtent: 300,
                      itemBuilder: (context, index) {
                        // if (index < controller.searchData!.data!.length) {
                        return GestureDetector(
                          onTap: () {
                            Get.to(const AdsDetails(),
                                binding: MyBinding(),
                                arguments:
                                    controller.searchData!.data![index].id);
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 20),
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
                                        controller
                                            .searchData!.data![index].titleLimit
                                            .toString(),
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: const TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        controller.searchData!.data![index]
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
                                        controller.searchData!.data![index]
                                                    .price ==
                                                0
                                            ? 'توافقی'
                                            : '${formatter.format(controller.searchData!.data![index].price)} تومان',
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                          // fontSize: 15,
                                          color: Colors.grey[600],
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        '${controller.searchData!.data![index].updatedAt} در ${controller.searchData!.data![index].state}',
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                          // fontSize: 15,
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
                                      borderRadius: BorderRadius.circular(5),
                                      image: DecorationImage(
                                        image: NetworkImage(
                                          controller.searchData!.data![index]
                                                  .imageUrl
                                                  .toString()
                                                  .startsWith(
                                                      'https://newagahi.ir')
                                              ? controller.searchData!
                                                  .data![index].imageUrl
                                                  .toString()
                                              : 'https://newagahi.ir${controller.searchData!.data![index].imageUrl.toString()}',
                                        ),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        );
                        // }
                        // else {
                        //   return const Padding(
                        //     padding: EdgeInsets.symmetric(vertical: 20),
                        //     child: Center(
                        //       child: SpinKitThreeBounce(
                        //         size: 25,
                        //         color: Color(0xffC42127),
                        //         duration: Duration(
                        //           seconds: 1,
                        //         ),
                        //       ),
                        //     ),
                        //   );
                        // }
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
