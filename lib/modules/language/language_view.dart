import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/language_controller.dart';

class LanguageView extends GetView<LanguageController> {
  const LanguageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        title: Text('language_title'.tr),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Get.back(),
        ),
      ),
      body: Obx(
        () => ListView(
          children: [
            // Subtitle section
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'language_subtitle'.tr,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey[600],
                ),
              ),
            ),

            // Vietnamese Option
            _buildLanguageTile(
              context: context,
              title: 'Tiếng Việt',
              subtitle: 'Vietnamese',
              languageCode: 'vi_VN',
              isSelected: controller.currentLanguageCode == 'vi_VN',
            ),

            const Divider(height: 1, indent: 72),

            // English Option
            _buildLanguageTile(
              context: context,
              title: 'English',
              subtitle: 'English',
              languageCode: 'en_US',
              isSelected: controller.currentLanguageCode == 'en_US',
            ),

            const Divider(height: 1, indent: 72),
          ],
        ),
      ),
    );
  }

  Widget _buildLanguageTile({
    required BuildContext context,
    required String title,
    required String subtitle,
    required String languageCode,
    required bool isSelected,
  }) {
    return InkWell(
      onTap: () {
        controller.changeLanguage(languageCode);
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Row(
          children: [
            // Language icon/flag container
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: Theme.of(context).brightness == Brightness.dark
                    ? Colors.grey[800]
                    : Colors.grey[200],
                borderRadius: BorderRadius.circular(20),
              ),
              child: Center(
                child: Text(
                  languageCode == 'vi_VN' ? '🇻🇳' : '🇺🇸',
                  style: const TextStyle(fontSize: 20),
                ),
              ),
            ),
            const SizedBox(width: 16),

            // Language name and subtitle
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight:
                          isSelected ? FontWeight.w600 : FontWeight.w400,
                      color: Theme.of(context).textTheme.bodyLarge?.color,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    subtitle,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[600],
                    ),
                  ),
                ],
              ),
            ),

            // Check mark for selected language
            if (isSelected)
              Icon(
                Icons.check_circle,
                color: Theme.of(context).primaryColor,
                size: 24,
              )
            else
              Icon(
                Icons.circle_outlined,
                color: Colors.grey[400],
                size: 24,
              ),
          ],
        ),
      ),
    );
  }
}
