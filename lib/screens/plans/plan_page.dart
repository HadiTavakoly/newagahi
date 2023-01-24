import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newagahi/constans.dart';
import 'package:newagahi/screens/plans/plan_controller.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class PlanPage extends GetView<PlanController> {
  const PlanPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('تعرفه ها'),
      ),
      body: Center(
        child: Obx(
          () => controller.isDataLoading.value
              ? SpinKitThreeBounce(
                  size: 25,
                  color: primaryColor,
                  duration: const Duration(
                    seconds: 1,
                  ),
                )
              : ListView.separated(
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(
                        controller.planData!.data![index].planTitle.toString(),
                      ),
                      trailing: Text(
                          '${controller.planData!.data![index].planPrice} تومان'),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return const Divider();
                  },
                  itemCount: controller.planData!.data!.length,
                ),
        ),
      ),
    );
  }
}
