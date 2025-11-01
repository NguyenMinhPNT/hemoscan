import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../app/theme/app_colors.dart';
import '../../widgets/gradient_button.dart';
import '../../widgets/custom_drawer.dart';
import 'home_controller.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Builder(
          builder: (context) => IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ),
        title: const Text('Anemia Detect AI Pro'),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: Obx(() {
              if (controller.username.value.isEmpty) {
                return IconButton(
                  icon: const CircleAvatar(child: Icon(Icons.person)),
                  onPressed: controller.navigateToProfile,
                );
              } else {
                return TextButton(
                  onPressed: controller.navigateToProfile,
                  child: Text(
                    controller.username.value,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                );
              }
            }),
          ),
        ],
      ),
      drawer: const CustomDrawer(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GradientButton(
              text: 'Scan Now',
              onPressed: controller.navigateToScan,
              width: Get.width * 0.7,
            ),
            SizedBox(height: Get.height * 0.03),
            GradientButton(
              text: 'History',
              onPressed: controller.navigateToHistory,
              width: Get.width * 0.7,
            ),
          ],
        ),
      ),
    );
  }
}
