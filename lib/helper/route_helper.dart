import 'dart:convert';
import 'package:get/get.dart';

import '../views/screens/auth/sign_in_screen.dart';


class RouteHelper {
  static const String initial = '/';
  static const String splash = '/splash';
  static const String signIn = '/sign-in';
  static const String signUp = '/sign-up';
  static const String main = '/main';
  static const String orderDetails = '/order-details';
  static const String editProfile = '/edit-profile';
  static const String addFood = '/add-food';
  static const String addFoodDetails = '/add-food-details';
  static const String forgotPass = '/forgot-pass';
  static const String verifyPass = '/verify-pass';
  static const String newPass = '/new-pass';
  static const String foodDetails = '/food-details';
  static const String category = '/category';
  static const String subCategory = '/sub-category';
  static const String addon = '/addon';
  static const String coupon = '/coupon';
  static const String addCoupon = '/add-coupon';
  static const String report = '/report';
  static const String expenseReport = '/expense-report';
  static const String restaurantSetting = '/restaurant-setting';
  static const String userProfile = '/user-profile';
  static String getInitialRoute() => initial;
  // static String getSplashRoute(NotificationBody? body) {
  //   String data = 'null';
  //   if(body != null) {
  //     List<int> encoded = utf8.encode(jsonEncode(body.toJson()));
  //     data = base64Encode(encoded);
  //   }
  //   return '$splash?data=$data';
  // }
  static String getSignInRoute() => signIn;
  static String getMainRoute() => main;
  static String getOrderDetailsRoute() => orderDetails;
  static String getSignUPRoute() => signUp;
  static String getEditProfileRoute() => editProfile;
  static String getAddFoodRoute() => addFood;
  static String getAddFoodDetailsRoute() => addFoodDetails;
  static String getForgotPassRoute() => forgotPass;
  static String getVerifyPass() => verifyPass;
  static String getNewPass() => newPass;
  static String getFoodDetails() => foodDetails;
  static String getCategoryRoute() => category;
  static String getSubCategoryRoute() => subCategory;
  static String getAddonRoute() => addon;
  static String getCouponRoute() => coupon;
  static String getAddCoupon() => addCoupon;
  static String getReportRoute() => report;
  static String getExpenseReportRoute() => expenseReport;
  static String getRestaurantSettingsRoute() => restaurantSetting;
  static String getUserProfile() => userProfile;

  static List<GetPage> routes = [
    GetPage(name: signIn, page: () => SignInScreen()),
    GetPage(name: initial, page: () => SignInScreen()),

  ];
}