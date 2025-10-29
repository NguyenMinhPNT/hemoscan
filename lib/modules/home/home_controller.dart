import 'package:get/get.dart';
import '../../app/routes/app_routes.dart';

class HomeController extends GetxController {
  void navigateToProfile() {
    Get.toNamed(AppRoutes.PROFILE);
  }

  void navigateToScan() {
    Get.toNamed(AppRoutes.SCAN);
  }

  void navigateToHistory() {
    // TODO: Implement history screen
    Get.snackbar('Info', 'History feature coming soon');
  }
}
