// // // import 'dart:convert';
// // // import 'package:http/http.dart' as http;
// // //
// // // import '../model/body/login_body.dart';
// // //
// // // class ApiClient {
// // //   static const String baseUrl = 'YOUR_API_BASE_URL';
// // //
// // //   Future<Map<String, dynamic>> login(LoginRequest request) async {
// // //     try {
// // //       final response = await http.post(
// // //         Uri.parse('$baseUrl/login'),
// // //         headers: <String, String>{
// // //           'Content-Type': 'application/json; charset=UTF-8',
// // //         },
// // //         body: jsonEncode(request.toJson()),
// // //       );
// // //
// // //       if (response.statusCode == 200) {
// // //         return jsonDecode(response.body);
// // //       } else {
// // //         throw Exception('Failed to login');
// // //       }
// // //     } catch (e) {
// // //       throw Exception('Network error: $e');
// // //     }
// // //   }
// // // }
// // import 'dart:convert';
// // import 'package:http/http.dart' as http;
// // import 'package:spycohubrestaurant/utils/app_constants.dart';
// //

// //   Future<Response> postData(String uri, dynamic body, {Map<String, String>? headers}) async {
// //     try {
// //       debugPrint('====> API Call: $uri\nHeader: $_mainHeaders');
// //       debugPrint('====> API Body: $body');
// //       http.Response response = await http.post(
// //         Uri.parse(appBaseUrl+uri),
// //         body: jsonEncode(body),
// //         headers: headers ?? _mainHeaders,
// //       ).timeout(Duration(seconds: timeoutInSeconds));
// //       return handleResponse(response, uri);
// //     } catch (e) {
// //       return const Response(statusCode: 1, statusText: noInternetMessage);
// //     }
// //   }
// //
// // // Future<Map<String, dynamic>> login(String email, String password) async {
// //   //   try {
// //   //     final response = await http.post(
// //   //       Uri.parse('${AppConstants.baseUrl}${AppConstants.loginUri}'),
// //   //       headers: <String, String>{
// //   //         'Accept': 'application/json',
// //   //         'Authorization': 'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiNGE1M2E5NWEzYTBjZjhiZDZkNGE1MDIxNDI2MmY5Mzc3YmQ2YjYyOTQzYmZjMjljY2Y4ZGM3N2IyMDJjYTZlNTQ0Yzc2MjMxYjhjZjZiOTUiLCJpYXQiOjE3MTIxNjkyOTkuNjA0OTM0LCJuYmYiOjE3MTIxNjkyOTkuNjA0OTM1LCJleHAiOjE3Mjc5ODA0OTkuNjAzOTk2LCJzdWIiOiIzIiwic2NvcGVzIjpbXX0.qLny5_041_p0Xwxdbd6fOkHFbuh90b6iF1exhRyd2zptA63PYLW_rCodfdk8bK86cM-8dKeJDjmv3uawFx3boxItq1v_kK9w7-GbxtlzyIaomnbOFrZyrnpcYuAp6c7IrukjuUfXIQ5e36beFGGhPMBBPDKpZO3PqauSdRntiXChMn-igfSNtEzUiAk6oRkY3U13IAdz9-UyLXYoZ7mUxOw10cThiPn-xIKL5SAtXE-pB9vxHKAKEi4TzdgpgBBeGbuu9e_WMdpvt-qqHnIB-WGqfrCH5Hyjg1uPcivVe7o5ShbYRit2rnuF0yORM8T-J2kRqsBQpcUgE0ze5Ap8CFcn1nytnRp3a181msH4l1847qr4mHbW5hYHojCdgOC3XuS-GfrDWxD-wT8Oz5hqoHOkZyrjGWfgsPWNBOdd4D80p0M-L8SOdWVGjrtvBlS2KMpSbgho6J9A7OWX84zhoQ1fqb7D8YMKRSPamEP0lyIihopY-EX75YK3pl_QlEA4Q-I0DXaqH23JW4Ul5dGau6A5y7cZSG2vDAQhLMWCLuSr9hLo-wu_GSmGEtiGtphaVUjeA1ziFmrN2kYDym-mi27BtjbqWLzkAgQhToXCn0vo9xfD6KivtBUZHyb_E-PMQskBwRjfmyS-zdps50yN-aGN0WXjdHHUfAJmTqW1sL0'
// //   //       },
// //   //       body: jsonEncode({
// //   //         'email': email,
// //   //         'password': password,
// //   //       }),
// //   //     );
// //   //     request.headers.addAll(headers);
// //   //     http.StreamedResponse response = await request.send();
// //   //
// //   //     if (response.statusCode == 200) {
// //   //       return jsonDecode(response.body);
// //   //     } else {
// //   //       throw Exception('Failed to login');
// //   //     }
// //   //   } catch (e) {
// //   //     throw Exception('Network error: $e');
// //   //   }
// //   // }
// // }
//



import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiClient {
  static const String appBaseUrl = 'https://spycotech.com/food/api/';
  static const Map<String, String> _mainHeaders = {
    'Accept': 'application/json',
    'Authorization': 'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiNGE1M2E5NWEzYTBjZjhiZDZkNGE1MDIxNDI2MmY5Mzc3YmQ2YjYyOTQzYmZjMjljY2Y4ZGM3N2IyMDJjYTZlNTQ0Yzc2MjMxYjhjZjZiOTUiLCJpYXQiOjE3MTIxNjkyOTkuNjA0OTM0LCJuYmYiOjE3MTIxNjkyOTkuNjA0OTM1LCJleHAiOjE3Mjc5ODA0OTkuNjAzOTk2LCJzdWIiOiIzIiwic2NvcGVzIjpbXX0.qLny5_041_p0Xwxdbd6fOkHFbuh90b6iF1exhRyd2zptA63PYLW_rCodfdk8bK86cM-8dKeJDjmv3uawFx3boxItq1v_kK9w7-GbxtlzyIaomnbOFrZyrnpcYuAp6c7IrukjuUfXIQ5e36beFGGhPMBBPDKpZO3PqauSdRntiXChMn-igfSNtEzUiAk6oRkY3U13IAdz9-UyLXYoZ7mUxOw10cThiPn-xIKL5SAtXE-pB9vxHKAKEi4TzdgpgBBeGbuu9e_WMdpvt-qqHnIB-WGqfrCH5Hyjg1uPcivVe7o5ShbYRit2rnuF0yORM8T-J2kRqsBQpcUgE0ze5Ap8CFcn1nytnRp3a181msH4l1847qr4mHbW5hYHojCdgOC3XuS-GfrDWxD-wT8Oz5hqoHOkZyrjGWfgsPWNBOdd4D80p0M-L8SOdWVGjrtvBlS2KMpSbgho6J9A7OWX84zhoQ1fqb7D8YMKRSPamEP0lyIihopY-EX75YK3pl_QlEA4Q-I0DXaqH23JW4Ul5dGau6A5y7cZSG2vDAQhLMWCLuSr9hLo-wu_GSmGEtiGtphaVUjeA1ziFmrN2kYDym-mi27BtjbqWLzkAgQhToXCn0vo9xfD6KivtBUZHyb_E-PMQskBwRjfmyS-zdps50yN-aGN0WXjdHHUfAJmTqW1sL0',
  };

  static const int timeoutInSeconds = 30;

  Future<Map<String, dynamic>> postData(String uri, dynamic body,
      {Map<String, String>? headers}) async {
    try {
      print('====> API Call: $uri\nHeader: $_mainHeaders');
      print('====> API Body: $body');
      var bodyEncoded = json.encode(body);
      http.Response response = await http.post(
        Uri.parse(appBaseUrl+uri),
        body: body,
        headers: headers ?? _mainHeaders,
      ).timeout(Duration(seconds: timeoutInSeconds));
      print('====> API Call: $uri\nHeader: $_mainHeaders');
      print('====> API Body: $body');
      return handleResponse(response);
    } catch (e) {
      return {
        'statusCode': 1,
        'statusText': 'No internet connection',
      };
    }
  }
  Map<String, dynamic> handleResponse(http.Response response) {
    if (response.statusCode == 200) {
      print("working");
      print("API Error Response: ${response.body}");
      return jsonDecode(response.body);
    } else {
      print("nooo");
      print(response);
      print("API Error Response: ${response.body}");
      return jsonDecode(response.body);
    }
  }
}


