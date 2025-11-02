import 'package:get/get.dart';
import 'vi_vn.dart';
import 'en_us.dart';

class AppTranslations extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'vi_VN': ViVN.translations,
        'en_US': EnUS.translations,
      };
}
