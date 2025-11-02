import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../../controllers/language_controller.dart';

class GuideController extends GetxController {
  // Biến lưu dữ liệu JSON
  final RxMap<String, dynamic> guideData = <String, dynamic>{}.obs;

  // Biến trạng thái loading
  final RxBool isLoading = true.obs;

  final languageController = Get.find<LanguageController>();

  @override
  void onInit() {
    super.onInit();
    loadGuideContent();

    // Listen to language changes and reload content
    ever(languageController.currentLocale, (_) => loadGuideContent());
  }

  /// Load guide data from JSON file
  Future<void> loadGuideContent() async {
    try {
      // Bắt đầu loading
      isLoading(true);

      // Determine which JSON file to load based on current language
      final String fileName = languageController.isEnglish
          ? 'assets/data/guide_en.json'
          : 'assets/data/guide_vi.json';

      // Đọc file JSON từ assets
      final String jsonString = await rootBundle.loadString(fileName);

      // Parse JSON string thành Map
      final Map<String, dynamic> parsedData = json.decode(jsonString);

      // Gán kết quả vào guideData
      guideData.value = parsedData;
    } catch (e) {
      // Xử lý lỗi nếu có
      Get.snackbar(
        'error'.tr,
        '${'error_analysis'.tr}: $e',
        snackPosition: SnackPosition.BOTTOM,
      );
    } finally {
      // Kết thúc loading
      isLoading(false);
    }
  }
}
