import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'about_controller.dart';

class AboutScreen extends GetView<AboutController> {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      // Hiển thị loading khi đang tải dữ liệu
      if (controller.isLoading.value) {
        return Scaffold(
          backgroundColor: Colors.pink.shade50,
          appBar: AppBar(
            title: const Text('Giới thiệu'),
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
          title: Text(controller.aboutData['title'] ?? 'Giới thiệu'),
          centerTitle: true,
          backgroundColor: Colors.white,
        ),
        body: Column(
          children: [
            const SizedBox(height: 24),
            // Logo ở trên cùng
            const CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('assets/images/mingx_logo.png'),
            ),
            const SizedBox(height: 24),
            // Nội dung sections
            Expanded(
              child: ListView.builder(
                itemCount: controller.aboutData['sections']?.length ?? 0,
                itemBuilder: (context, index) {
                  final section = controller.aboutData['sections'][index];
                  final contentList = section['content'] as List? ?? [];

                  return Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Tiêu đề section
                        Text(
                          section['sectionTitle'] ?? '',
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall
                              ?.copyWith(
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
            ),
          ],
        ),
      );
    });
  }
}
