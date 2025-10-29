import 'package:get/get.dart';
import '../../modules/splash/splash_screen.dart';
import '../../modules/splash/splash_binding.dart';
import '../../modules/home/home_screen.dart';
import '../../modules/home/home_binding.dart';
import '../../modules/profile/profile_screen.dart';
import '../../modules/profile/profile_binding.dart';
import '../../modules/scan/scan_screen.dart';
import '../../modules/scan/scan_binding.dart';
import '../../modules/result/result_screen.dart';
import '../../modules/result/result_binding.dart';
import 'app_routes.dart';

class AppPages {
  static final routes = [
    GetPage(
      name: AppRoutes.SPLASH,
      page: () => SplashScreen(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: AppRoutes.HOME,
      page: () => HomeScreen(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: AppRoutes.PROFILE,
      page: () => ProfileScreen(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: AppRoutes.SCAN,
      page: () => ScanScreen(),
      binding: ScanBinding(),
    ),
    GetPage(
      name: AppRoutes.RESULT,
      page: () => ResultScreen(),
      binding: ResultBinding(),
    ),
  ];
}
