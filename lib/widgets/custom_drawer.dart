import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
                const Text(
                  'MingX Hemoscan',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: Get.height * 0.01),
                const Text(
                  'Anemia Detection AI',
                  style: TextStyle(color: Colors.white70, fontSize: 14),
                ),
              ],
            ),
          ),
          _buildDrawerTile(
            icon: Icons.info_outline,
            title: 'Hướng dẫn',
            onTap: () => Get.back(),
          ),
          _buildDrawerTile(
            icon: Icons.bar_chart,
            title: 'Biểu đồ',
            onTap: () => Get.back(),
          ),
          _buildDrawerTile(
            icon: Icons.book_outlined,
            title: 'Kiến thức',
            onTap: () => Get.back(),
          ),
          _buildDrawerTile(
            icon: Icons.settings_outlined,
            title: 'Cài đặt',
            onTap: () => Get.back(),
          ),
          _buildDrawerTile(
            icon: Icons.contact_mail_outlined,
            title: 'Liên lạc',
            onTap: () => Get.back(),
          ),
          _buildDrawerTile(
            icon: Icons.health_and_safety_outlined,
            title: 'Sàng lọc',
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
  }) {
    return ListTile(leading: Icon(icon), title: Text(title), onTap: onTap);
  }
}
