import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class AboutController extends GetxController {
  // Biến lưu dữ liệu JSON
  final RxMap<String, dynamic> aboutData = <String, dynamic>{}.obs;

  // Biến trạng thái loading
  final RxBool isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    loadAboutContent();
  }

  /// Load about data from JSON file
  Future<void> loadAboutContent() async {
    try {
      // Bắt đầu loading
      isLoading(true);

      // Đọc file JSON từ assets
      final String jsonString =
          await rootBundle.loadString('assets/data/about_vi.json');

      // Parse JSON string thành Map
      final Map<String, dynamic> parsedData = json.decode(jsonString);

      // Gán kết quả vào aboutData
      aboutData.value = parsedData;
    } catch (e) {
      // Xử lý lỗi nếu có
      Get.snackbar(
        'Lỗi',
        'Không thể tải dữ liệu giới thiệu: $e',
        snackPosition: SnackPosition.BOTTOM,
      );
    } finally {
      // Kết thúc loading
      isLoading(false);
    }
  }
}
