import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newagahi/screens/plans/plan_controller.dart';

class PlanPage extends GetView<PlanController> {
  const PlanPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('خرید اشتراک'),
      ),
      body: Center(
        child: Obx(
          () => controller.isDataLoading.value
              ? const CircularProgressIndicator()
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
