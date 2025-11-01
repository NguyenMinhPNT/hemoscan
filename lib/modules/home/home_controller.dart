import 'package:get/get.dart';
import '../../app/routes/app_routes.dart';
import '../../services/storage_service.dart';

class HomeController extends GetxController {
  // StorageService instance
  final StorageService storageService = Get.find<StorageService>();

  // Observable username
  var username = ''.obs;

  @override
  void onInit() {
    super.onInit();
    // Load username from storage
    loadUsername();
  }

  /// Load username from storage
  void loadUsername() {
    final storedUsername = storageService.readData<String>('username');
    if (storedUsername != null && storedUsername.isNotEmpty) {
      username.value = storedUsername;
    }
  }

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
