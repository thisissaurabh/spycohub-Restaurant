//
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:nvc_restaurant_app/utils/styles.dart';
//
// import '../../controller/auth_controller.dart';
// import '../../helper/data_converter.dart';
// import '../../utils/dimensions.dart';
// import '../../utils/styles.dart';
// import 'custom_button.dart';
// import 'custom_snackbar.dart';
// import 'min_max_time_picker.dart';
//
// class CustomTimePicker extends StatelessWidget {
//   const CustomTimePicker({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     List<String> time = [];
//     for(int i = 1; i <= 60 ; i++){
//       time.add(i.toString());
//     }
//     List<String> unit = ['minute', 'hours', 'days'];
//
//     return Dialog(
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(Dimensions.radiusExtraLarge)),
//       insetPadding: const EdgeInsets.all(30),
//       clipBehavior: Clip.antiAliasWithSaveLayer,
//       child: Container(
//         width: 500,
//         padding: const EdgeInsets.all(Dimensions.paddingSizeLarge),
//         child: GetBuilder<AuthController>(
//             builder: (authController) {
//               return Column(
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   Text('Estimated Delivery Time' , style: poppinsMedium.copyWith(fontSize: Dimensions.fontSizeLarge)),
//                   const SizedBox(height: Dimensions.paddingSizeSmall),
//                   Text('Select Minimum and Maximum Time Duration Expected fro Delivery' ,
//                       textAlign: TextAlign.center,
//                       style: poppinsRegular.copyWith(fontSize: Dimensions.fontSizeSmall,
//                   color: Theme.of(context).disabledColor)),
//                   const SizedBox(height: Dimensions.paddingSizeDefault),
//                   Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
//                     SizedBox(
//                       width: 70,
//                       child: Text(
//                         'Min',
//                         style: poppinsRegular.copyWith(fontSize: Dimensions.fontSizeLarge,color: Theme.of(context).disabledColor),
//                         textAlign: TextAlign.center,
//                       ),
//                     ),
//                     const SizedBox(),
//
//                     SizedBox(
//                       width: 70,
//                       child: Text(
//                         'Max',
//                         style: poppinsRegular.copyWith(fontSize: Dimensions.fontSizeLarge,color: Theme.of(context).disabledColor),
//                         textAlign: TextAlign.center,
//                       ),
//                     ),
//                     SizedBox(
//                       width: 70,
//                       child: Text(
//                         'Unit',
//                         style: poppinsRegular.copyWith(fontSize: Dimensions.fontSizeLarge,color: Theme.of(context).disabledColor),
//                         textAlign: TextAlign.center,
//                       ),
//                     ),
//                   ]),
//                   const SizedBox(height: Dimensions.paddingSizeDefault),
//
//                   Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
//
//                     MinMaxTimePicker(
//                       times: time, onChanged: (int index)=> authController.minTimeChange(time[index]),
//                       initialPosition: 10,
//                     ),
//
//                     const Text(':', style: poppinsBold),
//
//                     MinMaxTimePicker(
//                       times: time, onChanged: (int index)=> authController.maxTimeChange(time[index]),
//                       initialPosition: 10,
//                     ),
//
//                     MinMaxTimePicker(
//                       times: unit, onChanged: (int index) => authController.timeUnitChange(unit[index]),
//                       initialPosition: 1,
//                     ),
//
//                   ]),
//
//                   Padding(
//                     padding: const EdgeInsets.symmetric(vertical: Dimensions.paddingSizeLarge),
//                     child: Text(
//                       '${authController.storeMinTime} - ${authController.storeMaxTime} ${authController.storeTimeUnit}',
//                       style: poppinsBold.copyWith(fontSize: Dimensions.fontSizeExtraLarge),
//                     ),
//                   ),
//
//                   CustomButton(
//                     width: 200,
//                     buttonText: 'save'.tr,
//                     onPressed: (){
//                       int min = int.parse(authController.storeMinTime);
//                       int max = int.parse(authController.storeMaxTime);
//                       if(min < max){
//                         Get.back();
//                       }else{
//                         showCustomSnackBar('maximum_delivery_time_can_not_be_smaller_then_minimum_delivery_time'.tr);
//                       }
//                     },
//                   ),
//
//                 ],
//               );
//             }
//         ),
//       ),
//     );
//   }
// }
//
//
//
// class CustomNormalTimePicker extends StatefulWidget {
//   final String title;
//   final String? time;
//   final Function(String?) onTimeChanged;
//   const CustomNormalTimePicker({Key? key, required this.title, required this.time, required this.onTimeChanged}) : super(key: key);
//
//   @override
//   State<CustomNormalTimePicker> createState() => _CustomNormalTimePickerState();
// }
//
// class _CustomNormalTimePickerState extends State<CustomNormalTimePicker> {
//   String? _myTime;
//
//   @override
//   void initState() {
//     super.initState();
//
//     _myTime = widget.time;
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
//
//       Text(
//         widget.title, maxLines: 1, overflow: TextOverflow.ellipsis,
//         style: poppinsRegular.copyWith(fontSize: Dimensions.fontSizeSmall, color: Theme.of(context).disabledColor),
//       ),
//       const SizedBox(height: Dimensions.paddingSizeExtraSmall),
//
//       InkWell(
//         onTap: () async {
//           TimeOfDay? time = await showTimePicker(
//             context: context, initialTime: TimeOfDay(hour: DateTime.now().hour, minute: DateTime.now().minute),
//             builder: (BuildContext context, Widget? child) {
//               return MediaQuery(
//                 data: MediaQuery.of(context).copyWith(
//                   alwaysUse24HourFormat: true
//                   // alwaysUse24HourFormat: Get.find<SplashController>().configModel!.timeformat == '24',
//                 ),
//                 child: child!,
//               );
//             },
//           );
//           if(time != null) {
//             setState(() {
//               _myTime = DateConverter.convertTimeToTime(DateTime(DateTime.now().year, 1, 1, time.hour, time.minute));
//             });
//             widget.onTimeChanged(_myTime);
//           }
//         },
//         child: Container(
//           height: 50, alignment: Alignment.center,
//           padding: const EdgeInsets.all(Dimensions.paddingSizeSmall),
//           decoration: BoxDecoration(
//             color: Theme.of(context).cardColor,
//             borderRadius: BorderRadius.circular(Dimensions.radiusSmall),
//             boxShadow: [BoxShadow(color: Colors.grey[Get.isDarkMode ? 800 : 200]!, spreadRadius: 2, blurRadius: 5, offset: const Offset(0, 5))],
//           ),
//           child: Row(children: [
//
//             Text(
//               _myTime != null ? DateConverter.convertStringTimeToTime(_myTime!) : 'pick_time'.tr, style: poppinsRegular,
//               maxLines: 1,
//             ),
//             const Expanded(child: SizedBox()),
//
//             const Icon(Icons.access_time, size: 20),
//
//           ]),
//         ),
//       ),
//
//     ]);
//   }
// }
