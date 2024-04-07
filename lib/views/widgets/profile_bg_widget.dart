//
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:nvc_restaurant_app/utils/styles.dart';
//
// import '../../utils/dimensions.dart';
// import '../../utils/images.dart';
//
// class ProfileBgWidget extends StatelessWidget {
//   final Widget circularImage;
//   final Widget mainWidget;
//   final bool backButton;
//   const ProfileBgWidget({Key? key, required this.mainWidget, required this.circularImage, required this.backButton}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(children: [
//
//       Stack(clipBehavior: Clip.none, children: [
//
//         SizedBox(
//           width: context.width, height: 260,
//           child: Center(child: Image.asset(Images.profileBg, height: 260, width: 1170, fit: BoxFit.fill)),
//         ),
//
//         Positioned(
//           top: 200, left: 0, right: 0, bottom: 0,
//           child: Center(
//             child: Container(
//               width: 1170,
//               decoration: BoxDecoration(
//                 borderRadius: const BorderRadius.vertical(top: Radius.circular(Dimensions.radiusExtraLarge)),
//                 color: Theme.of(context).cardColor,
//               ),
//             ),
//           ),
//         ),
//
//
//         backButton ? Positioned(
//           top: MediaQuery.of(context).padding.top, left: 10,
//           child: IconButton(
//             icon: Icon(Icons.arrow_back_ios, color: Theme.of(context).cardColor, size: 20),
//             onPressed: () => Get.back(),
//           ),
//         ) : const SizedBox(),
//
//         Positioned(
//           top: 150,
//           left: 80,
//           right: 80,
//           child: circularImage,
//         ),
//
//       ]),
//
//       Expanded(
//         child: mainWidget,
//       ),
//
//     ]);
//   }
// }