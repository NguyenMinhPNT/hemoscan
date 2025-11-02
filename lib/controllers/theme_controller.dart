import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../services/storage_service.dart';

class ThemeController extends GetxController {
  static const String _darkModeKey = 'isDarkMode';

  final isDarkMode = false.obs;
  late StorageService _storageService;

  @override
  void onInit() {
    super.onInit();
    _storageService = Get.find<StorageService>();
    _loadThemePreference();
  }

  void _loadThemePreference() {
    final savedDarkMode = _storageService.readData<bool>(_darkModeKey) ?? false;
    isDarkMode.value = savedDarkMode;
  }

  Future<void> toggleTheme() async {
    isDarkMode.toggle();
    await _storageService.saveData(_darkModeKey, isDarkMode.value);
    Get.changeTheme(isDarkMode.value ? ThemeData.dark() : ThemeData.light());
  }
}
