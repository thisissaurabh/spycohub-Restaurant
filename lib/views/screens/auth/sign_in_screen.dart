import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spycohubrestaurant/utils/styles.dart';
import '../../../controller/auth_controller.dart';
import '../../../utils/dimensions.dart';
import '../../../utils/images.dart';
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
      body: SafeArea(child: Center(
        child: Scrollbar(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.all(Dimensions.paddingSizeSmall),
            child: Center(
              child: SizedBox(
                width: 1170,
                child: GetBuilder<AuthController>(builder: (authController) {
                  return Column(children: [

                    const SizedBox(height: Dimensions.paddingSizeExtraSmall),
                    Image.asset(Images.logo, width: 220),
                    const SizedBox(height: Dimensions.paddingSizeSmall),
                    Text('SIGN IN', style: poppinsSemiBold.copyWith(fontSize: 32,
                        color: Theme.of(context).primaryColor)),
                    const SizedBox(height: Dimensions.paddingSizeExtraSmall),



                    Column(children: [
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
                        // onSubmit: (text) => GetPlatform.isWeb ? _login(authController) : null,
                      ),

                    ]),
                    const SizedBox(height: 10),

             /*       Row(children: [
                      Expanded(
                        child: ListTile(
                          onTap: () {
                            // =>
                            //     authController.toggleRememberMe()
                          },
                          leading: Checkbox(
                            activeColor: Theme.of(context).primaryColor,
                            value: authController.isActiveRememberMe,
                            onChanged: (bool? isChecked) => authController.toggleRememberMe(),
                          ),
                          title: Text('Remember Me'),
                          contentPadding: EdgeInsets.zero,
                          dense: true,
                          horizontalTitleGap: 0,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Get.toNamed(RouteHelper.getForgotPassRoute(),);
                          *//* =>
                          Get.toNamed(RouteHelper.getForgotPassRoute()*//*},
                        child: const Text('Forgot password?',
                        ),
                      ),
                    ]),*/
                    const SizedBox(height: 50),

                    CustomButton(
                      buttonText: 'Sign In',
                      onPressed: () => _login(authController),
                    ) ,
                    TextButton(
                      style: TextButton.styleFrom(
                        minimumSize: const Size(1, 40),
                      ),
                      onPressed: () async {
                        // Get.toNamed(RouteHelper.getSignUPRoute());
                        /* Get.toNamed(RouteHelper.getRestaurantRegistrationRoute());*/
                      },
                      child: RichText(text: TextSpan(children: [
                        TextSpan(text: 'join as ', style: poppinsRegular.copyWith(color: Theme.of(context).disabledColor)),
                        TextSpan(text: 'Restaurant', style: poppinsRegular.copyWith(color: Theme.of(context).textTheme.bodyLarge!.color)),
                      ])),
                    ) /*: const SizedBox(),*/
                  ]);
                }),
              ),
            ),
          ),
        ),
      )),
    );
  }
/*  void _login(AuthController authController) async {
    String email = _emailController.text.trim();
    String password = _passwordController.text.trim();
    if (email.isEmpty) {
      showCustomSnackBar('enter_email_address');
    }else if (!GetUtils.isEmail(email)) {
      showCustomSnackBar('enter_a_valid_email_address');
    }else if (password.isEmpty) {
      showCustomSnackBar('enter_password');
    }else if (password.length < 6) {
      showCustomSnackBar('password_should_be');
    }else {
      // authController.login(_emailController.text, _passwordController.text);
      authController.login( email: email, password: password);
    }

  }*/

  void _login(AuthController authController) async {
    String email = _emailController.text.trim();
    String password = _passwordController.text.trim();
    if (email.isEmpty) {
      showCustomSnackBar('enter_email_address');
    } else if (!GetUtils.isEmail(email)) {
      showCustomSnackBar('enter_a_valid_email_address');
    } else if (password.isEmpty) {
      showCustomSnackBar('enter_password');
    } else if (password.length < 6) {
      showCustomSnackBar('password_should_be');
    } else {
      Map<String, dynamic> response = await authController.login(
        email: email,
        password: password,
      );

      // Check if the API call was successful
      if (response.containsKey('statusCode') && response['statusCode'] == 1) {
        print('API Response: $response');
        // API call failed
        showCustomSnackBar(response['statusText']);
      } else {
        // API call successful, print response
        print('API Response: $response');
        // Here you can navigate to the next screen or perform any action
      }
    }
  }


}
