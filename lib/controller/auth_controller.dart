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
import '../data/model/body/login_body.dart';
import '../data/repository/auth_repo.dart';


class AuthController extends GetxController implements GetxService {
  final AuthRepo authRepo;
  AuthController({required this.authRepo}) ;

  Future<Map<String, dynamic>> login(String? email , String password ) async {
    // var body = {
    //   'email': email,
    //   'password': password,
    // };
    return await authRepo.login(email, password);
  }
}

