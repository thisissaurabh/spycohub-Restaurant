//
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:nvc_restaurant_app/utils/styles.dart';
//
// import '../../controller/auth_controller.dart';
// import '../../data/model/response/menu-model.dart';
// import '../../utils/dimensions.dart';
// import '../../utils/images.dart';
// import 'custom_snackbar.dart';
//
// class MenuButton extends StatelessWidget {
//   final MenuModel menu;
//   final bool isProfile;
//   final bool isLogout;
//   const MenuButton({Key? key, required this.menu, required this.isProfile, required this.isLogout}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     double size = (context.width/4)-Dimensions.paddingSizeDefault;
//
//     return InkWell(
//       onTap: () {
//         if(menu.isBlocked) {
//           showCustomSnackBar('This feature is blocked by admin');
//         }else if(menu.isNotSubscribe){
//           showCustomSnackBar('you have no available ubscription');
//         } else {
//           if (isLogout) {
//             Get.back();
//             // if (Get.find<AuthController>().isLoggedIn()) {
//             //   Get.dialog(ConfirmationDialog(icon: Images.support, description: 'are_you_sure_to_logout'.tr, isLogOut: true, onYesPressed: () {
//             //     Get.find<AuthController>().clearSharedData();
//             //     Get.offAllNamed(RouteHelper.getSignInRoute());
//             //   }), useSafeArea: false);
//             // } else {
//             //   Get.find<AuthController>().clearSharedData();
//             //   Get.toNamed(RouteHelper.getSignInRoute());
//             // }
//           } else {
//             Get.offNamed(menu.route);
//           }
//         }
//       },
//       child: Column(children: [
//
//         Container(
//           height: size-(size*0.2),
//           padding: const EdgeInsets.all(Dimensions.paddingSizeDefault),
//           margin: const EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeSmall),
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(Dimensions.radiusDefault),
//             color:/* isLogout ? Get.find<AuthController>().isLoggedIn() ? Colors.red : Colors.green :*/ Theme.of(context).primaryColor,
//             boxShadow: [BoxShadow(color: Colors.grey[Get.isDarkMode ? 800 : 200]!, spreadRadius: 1, blurRadius: 5)],
//           ),
//           alignment: Alignment.center,
//           child: isProfile ? ProfileImageWidget(size: size) : Image.asset(menu.icon, width: size, height: size, color: Colors.white),
//         ),
//         const SizedBox(height: Dimensions.paddingSizeExtraSmall),
//
//         Text(menu.title,
//             maxLines: 2,
//             style: poppinsMedium.copyWith(fontSize: Dimensions.fontSizeSmall), textAlign: TextAlign.center),
//
//       ]),
//     );
//   }
// }
//
// class ProfileImageWidget extends StatelessWidget {
//   final double size;
//   const ProfileImageWidget({Key? key, required this.size}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return GetBuilder<AuthController>(builder: (authController) {
//       return Container(
//         decoration: BoxDecoration(shape: BoxShape.circle, border: Border.all(width: 2, color: Colors.white)),
//         child: ClipOval(
//           child: Image.asset(Images.profilePlaceholder),
//           // child: CustomImage(
//           //   image: '${Get.find<SplashController>().configModel!.baseUrls!.vendorImageUrl}'
//           //       '/${(authController.profileModel != null && Get.find<AuthController>().isLoggedIn()) ? authController.profileModel!.image ?? '' : ''}',
//           //   width: size, height: size, fit: BoxFit.cover,
//           // ),
//         ),
//       );
//     });
//   }
// }