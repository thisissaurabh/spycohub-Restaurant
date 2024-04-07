import 'package:flutter/material.dart';
import 'package:get/get.dart';


import '../../../controller/auth_controller.dart';
import '../../../utils/dimensions.dart';
import '../../../utils/images.dart';
import '../../../utils/styles.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_snackbar.dart';
import '../../widgets/custom_textfield_widget.dart';

class SignInScreen extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final FocusNode _emailFocus = FocusNode();
  final FocusNode _passwordFocus = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Scrollbar(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.all(Dimensions.paddingSizeSmall),
              child: Center(
                child: SizedBox(
                  width: 1170,
                  child: GetBuilder<AuthController>(builder: (authController) {
                    return Column(
                      children: [
                        const SizedBox(height: Dimensions.paddingSizeExtraSmall),
                        Image.asset(Images.logo, width: 220),
                        const SizedBox(height: Dimensions.paddingSizeSmall),
                        Text(
                          'SIGN IN',
                          style: poppinsSemiBold.copyWith(fontSize: 32, color: Theme.of(context).primaryColor),
                        ),
                        const SizedBox(height: Dimensions.paddingSizeExtraSmall),
                        Column(
                          children: [
                            CustomTextField(
                              hintText: 'E-Mail',
                              controller: _emailController,
                              focusNode: _emailFocus,
                              nextFocus: _passwordFocus,
                              inputType: TextInputType.emailAddress,
                              prefixIcon: Icons.mail_outline_rounded,
                              divider: false,
                              showBorder: false,
                            ),
                            const SizedBox(height: Dimensions.paddingSizeExtraSmall),
                            CustomTextField(
                              hintText: 'Password',
                              controller: _passwordController,
                              focusNode: _passwordFocus,
                              inputAction: TextInputAction.done,
                              inputType: TextInputType.visiblePassword,
                              prefixIcon: Icons.lock,
                              isPassword: true,
                              showBorder: false,
                              divider: false,
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        CustomButton(
                          buttonText: 'Sign In',
                          onPressed: () => _login(authController),
                        ),
                        TextButton(
                          style: TextButton.styleFrom(
                            minimumSize: const Size(1, 40),
                          ),
                          onPressed: () async {
                            // Get.toNamed(RouteHelper.getForgotPassRoute());
                          },
                          child: RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: 'join as ',
                                  style: poppinsRegular.copyWith(color: Theme.of(context).disabledColor),
                                ),
                                TextSpan(
                                  text: 'Restaurant',
                                  style: poppinsRegular.copyWith(color: Theme.of(context).textTheme.bodyLarge!.color),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    );
                  }),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _login(AuthController authController) async {
    String email = _emailController.text.trim();
    String password = _passwordController.text.trim();
    if (email.isEmpty) {
      showCustomSnackBar('enter_email_address'.tr);
    }else if (!GetUtils.isEmail(email)) {
      showCustomSnackBar('enter_a_valid_email_address'.tr);
    }else if (password.isEmpty) {
      showCustomSnackBar('enter_password'.tr);
    }else if (password.length < 6) {
      showCustomSnackBar('password_should_be'.tr);
    }else {
      authController.login(email, password).then((status) async {
        // if(status != null) {
        //   if (status.isSuccess) {
        //     if (authController.isActiveRememberMe) {
        //       authController.saveUserNumberAndPassword(email, password);
        //     } else {
        //       authController.clearUserNumberAndPassword();
        //     }
        //     await Get.find<AuthController>().getProfile();
        //     Get.offAllNamed(RouteHelper.getInitialRoute());
        //   }else {
        //     if(status.message != 'no') {
        //       showCustomSnackBar(status.message);
        //     }
        //   }
        // }
      });
    }
  }

}
