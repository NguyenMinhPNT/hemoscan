import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../app/routes/app_routes.dart';
import '../controllers/theme_controller.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFF4CAF50), Color(0xFFE91E63)],
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'app_name'.tr,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: Get.height * 0.01),
                Text(
                  'app_subtitle'.tr,
                  style: const TextStyle(color: Colors.white70, fontSize: 14),
                ),
              ],
            ),
          ),
          _buildDrawerTile(
            icon: Icons.info_outline,
            title: 'menu_about'.tr,
            onTap: () {
              Get.back(); // Đóng drawer trước
              Get.toNamed(AppRoutes.ABOUT); // Sau đó điều hướng
            },
          ),
          _buildDrawerTile(
            icon: Icons.help_outline,
            title: 'menu_guide'.tr,
            onTap: () {
              Get.back(); // Đóng drawer trước
              Get.toNamed(AppRoutes.GUIDE); // Sau đó điều hướng
            },
          ),
          _buildDrawerTile(
            icon: Icons.bar_chart,
            title: 'menu_chart'.tr,
            onTap: () => Get.back(),
          ),
          _buildDrawerTile(
            icon: Icons.book_outlined,
            title: 'menu_knowledge'.tr,
            onTap: () => Get.back(),
          ),
          _buildDrawerTile(
            icon: Icons.settings_outlined,
            title: 'menu_theme'.tr,
            onTap: () => Get.back(),
            hasToggle: true,
          ),
          _buildDrawerTile(
            icon: Icons.language_outlined,
            title: 'menu_language'.tr,
            onTap: () {
              Get.back(); // Đóng drawer trước
              Get.toNamed(AppRoutes.LANGUAGE); // Sau đó điều hướng
            },
          ),
          _buildDrawerTile(
            icon: Icons.contact_mail_outlined,
            title: 'menu_contact'.tr,
            onTap: () => Get.back(),
          ),
          _buildDrawerTile(
            icon: Icons.health_and_safety_outlined,
            title: 'menu_screening'.tr,
            onTap: () => Get.back(),
          ),
        ],
      ),
    );
  }

  Widget _buildDrawerTile({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
    bool hasToggle = false,
  }) {
    if (hasToggle) {
      // Drawer tile cho "Cài đặt" với toggle dark mode
      final themeController = Get.put(ThemeController());
      return Obx(
        () => ListTile(
          leading: Icon(icon),
          title: Text(title),
          trailing: Switch(
            value: themeController.isDarkMode.value,
            onChanged: (_) {
              themeController.toggleTheme();
            },
          ),
          onTap: onTap,
        ),
      );
    }
    return ListTile(leading: Icon(icon), title: Text(title), onTap: onTap);
  }
}
