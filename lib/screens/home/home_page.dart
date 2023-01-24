import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:newagahi/bindings/my_binding.dart';
import 'package:newagahi/screens/ads_details/ads_details_page.dart';
import 'package:newagahi/screens/home/home_controller.dart';
import 'package:newagahi/screens/search/search_page.dart';
import '../category/category_controller.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../subcategory/subcategory_page.dart';
import '../state/select_state_page.dart';
import '../../constans.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        titleSpacing: 10,
        centerTitle: true,
        title: Container(
          padding: const EdgeInsets.all(4),
          width: Get.width,
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.grey.withOpacity(0.5)),
            borderRadius: BorderRadius.circular(10),
          ),
          child: IntrinsicHeight(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Get.to(
                          () => SearchPage(),
                          binding: MyBinding(),
                        );
                      },
                      child: Row(
                        children: const [
                          Icon(
                            Icons.search,
                            color: Colors.grey,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            // Get.find<HomeController>().list.length.toString(),
                            'جستجو در همه آگهی ها',
                            style: TextStyle(
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                VerticalDivider(
                  width: 20,
                  thickness: 1,
                  color: Colors.grey.withOpacity(0.5),
                ),
                GestureDetector(
                  onTap: () {
                    Get.to(
                       SelectStatePage(),
                      binding: MyBinding(),
                    );
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Obx(
                        () => Text(
                          Get.find<HomeController>().cityName.value == ''
                              ? 'همه شهر ها'
                              : Get.find<HomeController>().cityName.value,
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      const Icon(
                        Icons.location_on_outlined,
                        color: Colors.grey,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        bottom: PreferredSize(
          preferredSize: Size(Get.width, Get.height / 6 * 3 / 4),
          child: Container(
            height: Get.height / 6 * 3 / 4,
            color: Colors.grey[50],
            child: Obx(
              () {
                return Get.find<CategoryController>().isDataLoading.value
                    ? const Center(
                        child: SpinKitThreeBounce(
                          size: 25,
                          color: Color(0xffC42127),
                          duration: Duration(
                            seconds: 1,
                          ),
                        ),
                      )
                    : ListView.builder(
                        itemCount: Get.find<CategoryController>()
                            .categoriesData!
                            .data!
                            .length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              Get.to(
                                const SubCategory(),
                                binding: MyBinding(),
                                arguments: [
                                  Get.find<CategoryController>()
                                      .args
                                      .toString(),
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
                            child: SizedBox(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    width: Get.width / 4,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        CircleAvatar(
                                          radius: 24,
                                          backgroundColor:
                                              Colors.grey.withOpacity(0.5),
                                          child: CircleAvatar(
                                            backgroundColor: Colors.white,
                                            radius: 23,
                                            child: FaIcon(
                                              // FontAwesomeIcons.graduationCap,
                                              getIcon(
                                                Get.find<CategoryController>()
                                                    .categoriesData!
                                                    .data![index]
                                                    .icon
                                                    .toString(),
                                              ),

                                              color: const Color(0xff595A5C),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          Get.find<CategoryController>()
                                              .categoriesData!
                                              .data![index]
                                              .name
                                              .toString(),
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                        scrollDirection: Axis.horizontal,
                      );
              },
            ),
          ),
        ),
      ),
      body: GetBuilder<HomeController>(
        init: Get.find<HomeController>(),
        builder: (value) => ListView.separated(
          controller: value.controller,
          itemCount: value.list.length + 1,
          cacheExtent: 300,
          itemBuilder: (context, index) {
            if (index < value.list.length) {
              return GestureDetector(
                onTap: () {
                  Get.to(const AdsDetails(),
                      binding: MyBinding(), arguments: value.list[index].id);
                },
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  height: Get.height / 5,
                  width: Get.width,
                  color: Colors.white,
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              value.list[index].titleLimit.toString(),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              value.list[index].descriptionLimit.toString(),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                color: Colors.grey[600],
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const Spacer(),
                            Text(
                              value.list[index].price == 0
                                  ? 'توافقی'
                                  : '${formatter.format(value.list[index].price)} تومان',
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                // fontSize: 15,
                                color: Colors.grey[600],
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              '${value.list[index].updatedAt} در ${value.list[index].city}',
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
                                value.list[index].imageUrl
                                        .toString()
                                        .startsWith('https://newagahi.ir')
                                    ? value.list[index].imageUrl.toString()
                                    : 'https://newagahi.ir${value.list[index].imageUrl.toString()}',
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
            } else {
              return const Padding(
                padding: EdgeInsets.symmetric(vertical: 20),
                child: Center(
                    child: SpinKitThreeBounce(
                  size: 25,
                  color: Color(0xffC42127),
                  duration: Duration(
                    seconds: 1,
                  ),
                )),
              );
            }
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
    );
  }
}
