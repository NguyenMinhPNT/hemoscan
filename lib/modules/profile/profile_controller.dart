import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../services/storage_service.dart';
import '../home/home_controller.dart';

class ProfileController extends GetxController {
  // TextEditingControllers
  late TextEditingController usernameController;
  late TextEditingController passwordController;

  // Form key
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  // StorageService instance
  final StorageService storageService = Get.find<StorageService>();

  // Observable for login status
  var isLoggedIn = false.obs;

  @override
  void onInit() {
    super.onInit();
    // Initialize controllers
    usernameController = TextEditingController();
    passwordController = TextEditingController();

    // Check if user is logged in
    checkLoginStatus();
  }

  @override
  void onClose() {
    // Dispose controllers
    usernameController.dispose();
    passwordController.dispose();
    super.onClose();
  }

  /// Check if user is logged in
  void checkLoginStatus() {
    final username = storageService.readData<String>('username');
    isLoggedIn.value = username != null && username.isNotEmpty;
  }

  /// Register new user
  Future<void> register() async {
    if (formKey.currentState!.validate()) {
      // Save username and password
      await storageService.saveData('username', usernameController.text);
      await storageService.saveData('password', passwordController.text);

      // Update login status
      isLoggedIn.value = true;

      // Update HomeController username
      try {
        final homeController = Get.find<HomeController>();
        homeController.username.value = usernameController.text;
      } catch (e) {
        // HomeController might not be initialized yet
      }

      // Show success message
      Get.snackbar(
        'Thành công',
        'Ok cưng, đã đăng ký thành công',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
        duration: const Duration(seconds: 2),
      );

      // Go back to home screen
      Get.back();
    }
  }

  /// Login user
  Future<void> login() async {
    if (formKey.currentState!.validate()) {
      // Get stored credentials
      final storedUsername = storageService.readData<String>('username');
      final storedPassword = storageService.readData<String>('password');

      // Check if credentials match
      if (storedUsername == usernameController.text &&
          storedPassword == passwordController.text) {
        // Login successful
        isLoggedIn.value = true;

        // Update HomeController username
        try {
          final homeController = Get.find<HomeController>();
          homeController.username.value = usernameController.text;
        } catch (e) {
          // HomeController might not be initialized yet
        }

        // Go back to home screen
        Get.back();
      } else {
        // Login failed
        Get.snackbar(
          'Lỗi',
          'Username hoặc password không đúng!',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white,
          duration: const Duration(seconds: 2),
        );
      }
    }
  }

  /// Logout user
  Future<void> logout() async {
    // Update login status
    isLoggedIn.value = false;

    // Clear text controllers
    usernameController.clear();
    passwordController.clear();

    // Update HomeController username
    try {
      final homeController = Get.find<HomeController>();
      homeController.username.value = '';
    } catch (e) {
      // HomeController might not be initialized yet
    }

    // Show success message
    Get.snackbar(
      'Đăng xuất',
      'Đã đăng xuất thành công!',
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.orange,
      colorText: Colors.white,
      duration: const Duration(seconds: 2),
    );

    // Go back to home screen
    Get.back();
  }
}
