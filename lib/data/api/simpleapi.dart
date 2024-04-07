//
// import 'dart:convert';
//
// class ApiClient {
//   Future login({
//     required String email,
//     required String password,
//     // required String phone,
//   }) async {
//     var headers = {
//       'Accept': 'application/json',
//       'Authorization': 'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiNGE1M2E5NWEzYTBjZjhiZDZkNGE1MDIxNDI2MmY5Mzc3YmQ2YjYyOTQzYmZjMjljY2Y4ZGM3N2IyMDJjYTZlNTQ0Yzc2MjMxYjhjZjZiOTUiLCJpYXQiOjE3MTIxNjkyOTkuNjA0OTM0LCJuYmYiOjE3MTIxNjkyOTkuNjA0OTM1LCJleHAiOjE3Mjc5ODA0OTkuNjAzOTk2LCJzdWIiOiIzIiwic2NvcGVzIjpbXX0.qLny5_041_p0Xwxdbd6fOkHFbuh90b6iF1exhRyd2zptA63PYLW_rCodfdk8bK86cM-8dKeJDjmv3uawFx3boxItq1v_kK9w7-GbxtlzyIaomnbOFrZyrnpcYuAp6c7IrukjuUfXIQ5e36beFGGhPMBBPDKpZO3PqauSdRntiXChMn-igfSNtEzUiAk6oRkY3U13IAdz9-UyLXYoZ7mUxOw10cThiPn-xIKL5SAtXE-pB9vxHKAKEi4TzdgpgBBeGbuu9e_WMdpvt-qqHnIB-WGqfrCH5Hyjg1uPcivVe7o5ShbYRit2rnuF0yORM8T-J2kRqsBQpcUgE0ze5Ap8CFcn1nytnRp3a181msH4l1847qr4mHbW5hYHojCdgOC3XuS-GfrDWxD-wT8Oz5hqoHOkZyrjGWfgsPWNBOdd4D80p0M-L8SOdWVGjrtvBlS2KMpSbgho6J9A7OWX84zhoQ1fqb7D8YMKRSPamEP0lyIihopY-EX75YK3pl_QlEA4Q-I0DXaqH23JW4Ul5dGau6A5y7cZSG2vDAQhLMWCLuSr9hLo-wu_GSmGEtiGtphaVUjeA1ziFmrN2kYDym-mi27BtjbqWLzkAgQhToXCn0vo9xfD6KivtBUZHyb_E-PMQskBwRjfmyS-zdps50yN-aGN0WXjdHHUfAJmTqW1sL0'
//     };
//     var request = http.MultipartRequest('POST', Uri.parse('https://spycotech.com/food/api/login'));
//     request.fields.addAll({
//       'email': email,
//       'password': password,
//     });
//     print(request.fields);
//     request.headers.addAll(headers);
//     http.StreamedResponse response = await request.send();
//     var resp = jsonDecode(await response.stream.bytesToString());
//     if(response.statusCode == 200) {
//       if(resp['status'] == 1){
//         print(resp);
//         return resp;
//       }
//     } else {
//       print(resp);
//       print(response.statusCode);
//       print(response.reasonPhrase);
//       return resp;
//     }
//   }
