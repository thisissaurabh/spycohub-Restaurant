// import 'package:get/get.dart';
//
//
// import '../data/api/api_client.dart';
// import '../data/model/body/login_body.dart';
//
// class AuthController extends GetxController {
//   final ApiClient apiClient = ApiClient();
//
//   Future<void> login(String username, String password) async {
//     try {
//       final request = LoginRequest(username: username, password: password);
//       final response = await apiClient.login(request);
//
//       // Handle successful login response here
//     } catch (e) {
//       // Handle login error
//     }
//   }
// }
import 'package:get/get.dart';

import '../data/api/api_client.dart';



// class AuthController extends GetxController {
//   final ApiClient apiClient = ApiClient();
//
//   // Future<void> login(String email, String password) async {
//   //   try {
//   //     final response = await apiClient.login( email: email, password: password);
//   //     print("Login successful: $response"); // Add this line for debugging
//   //     // Handle successful login response here
//   //   } catch (e) {
//   //     print("Login error: $e"); // Add this line for debugging
//   //     // Handle login error
//   //   }
//   // }
//   Future<Map<String, dynamic>> login({
//     required String email,
//     required String password,
//   }) async {
//     var body = {
//       'email': email,
//       'password': password,
//     };
//     return await apiClient.postData('login', body);
//   }
// }
//


class AuthController extends GetxController {
  final ApiClient apiClient = ApiClient();

  Future<Map<String, dynamic>> login({
    required String email,
    required String password,
  }) async {
    var body = {
      'email': email,
      'password': password,
    };
    return await apiClient.postData('login', body);
  }
}
