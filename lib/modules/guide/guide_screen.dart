import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'guide_controller.dart';

class GuideScreen extends GetView<GuideController> {
  const GuideScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      // Hiển thị loading khi đang tải dữ liệu
      if (controller.isLoading.value) {
        return Scaffold(
          backgroundColor: Colors.pink.shade50,
          appBar: AppBar(
            title: Text('guide_title'.tr),
            centerTitle: true,
            backgroundColor: Colors.white,
          ),
          body: const Center(child: CircularProgressIndicator()),
        );
      }

      // Hiển thị nội dung khi đã load xong
      return Scaffold(
        backgroundColor: Colors.pink.shade50,
        appBar: AppBar(
          title: Text(controller.guideData['title'] ?? 'guide_title'.tr),
          centerTitle: true,
          backgroundColor: Colors.white,
        ),
        body: ListView.builder(
          itemCount: controller.guideData['sections']?.length ?? 0,
          itemBuilder: (context, index) {
            final section = controller.guideData['sections'][index];
            final contentList = section['content'] as List? ?? [];

            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Tiêu đề section
                  Text(
                    section['sectionTitle'] ?? '',
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  const SizedBox(height: 8),
                  // Nội dung section
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: contentList.map((contentString) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: Text(
                          contentString.toString(),
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      );
                    }).toList(),
                  ),
                ],
              ),
            );
          },
        ),
      );
    });
  }
}
