
import 'package:shared_preferences/shared_preferences.dart';
import 'package:get/get.dart';
import 'package:spycohubrestaurant/controller/auth_controller.dart';
import '../data/api/api_client.dart';
import '../data/repository/auth_repo.dart';
import '../utils/app_constants.dart';

Future<void> init() async {
  final sharedPreferences = await SharedPreferences.getInstance();
  Get.lazyPut(() => sharedPreferences);
  Get.lazyPut(() => ApiClient());
  Get.lazyPut(() => AuthRepo(apiClient: Get.find(), sharedPreferences: Get.find()));
  Get.lazyPut(() => AuthController(authRepo: Get.find()));
  // Get.lazyPut(() => AuthController());
}
