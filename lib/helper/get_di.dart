
import 'package:shared_preferences/shared_preferences.dart';
import 'package:get/get.dart';
import 'package:spycohubrestaurant/controller/auth_controller.dart';
import '../utils/app_constants.dart';

Future<void> init() async {
  final sharedPreferences = await SharedPreferences.getInstance();
  Get.lazyPut(() => sharedPreferences);
  Get.lazyPut(() => AuthController());
}
