import 'dart:ui';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class LanguageController extends GetxController {
  final _storage = GetStorage();
  final _languageKey = 'language';

  // Observable current locale
  var currentLocale = const Locale('vi', 'VN').obs;

  @override
  void onInit() {
    super.onInit();
    _loadLanguage();
  }

  // Load saved language preference
  void _loadLanguage() {
    final savedLanguage = _storage.read(_languageKey);
    if (savedLanguage != null) {
      if (savedLanguage == 'en_US') {
        currentLocale.value = const Locale('en', 'US');
      } else {
        currentLocale.value = const Locale('vi', 'VN');
      }
    }
  }

  // Change language
  void changeLanguage(String languageCode) {
    Locale newLocale;

    if (languageCode == 'en_US') {
      newLocale = const Locale('en', 'US');
    } else {
      newLocale = const Locale('vi', 'VN');
    }

    currentLocale.value = newLocale;
    Get.updateLocale(newLocale);
    _storage.write(_languageKey, languageCode);

    // Show snackbar
    Get.snackbar(
      'language_title'.tr,
      languageCode == 'en_US'
          ? 'language_changed'.tr
          : 'Đã chuyển sang tiếng Việt',
      snackPosition: SnackPosition.BOTTOM,
      duration: const Duration(seconds: 2),
    );
  }

  // Get current language code
  String get currentLanguageCode {
    if (currentLocale.value.languageCode == 'en') {
      return 'en_US';
    }
    return 'vi_VN';
  }

  // Check if current language is Vietnamese
  bool get isVietnamese => currentLocale.value.languageCode == 'vi';

  // Check if current language is English
  bool get isEnglish => currentLocale.value.languageCode == 'en';
}
