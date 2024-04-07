import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';
import '../../utils/app_constants.dart';
import '../api/api_client.dart';

class AuthRepo {
  final ApiClient apiClient;
  final SharedPreferences sharedPreferences;
  AuthRepo({required this.apiClient, required this.sharedPreferences});

  Future<Map<String, dynamic>> login(String? email, String password) async {
    return await apiClient.postData(AppConstants.loginUri, {"email": email, "password": password});
  }
}
