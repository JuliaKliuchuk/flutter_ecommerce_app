import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/pages/auth/sign_up_page.dart';
import 'package:flutter_ecommerce_app/routes/route_helper.dart';
import 'package:get/get.dart';

import '../../base/custom_loader.dart';
import '../../base/show_custom_snack_bar.dart';
import '../../controllers/auth_controller.dart';
import '../../utils/colors.dart';
import '../../utils/dimensions.dart';
import '../../widgets/app_text_field.dart';
import '../../widgets/big_text.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    var phoneController = TextEditingController();
    var passController = TextEditingController();

    void login(AuthController authController) {
      String phone = phoneController.text.trim();
      String password = passController.text.trim();

      if (phone.isEmpty) {
        showCustomSnackBar(
          'Type in your phone',
          title: 'Phone number',
        );
      } else if (password.isEmpty) {
        showCustomSnackBar(
          'Type in your password',
          title: 'Password',
        );
      } else if (password.length < 6) {
        showCustomSnackBar(
          'Password can not be less than 6 characters',
          title: 'Password',
        );
      } else {
        showCustomSnackBar(
          'All went well',
          title: 'Perfect',
        );

        authController.login(phone, password).then((status) {
          if (status.isSuccess) {
            Get.toNamed(RouteHelper.getInitial());
          } else {
            showCustomSnackBar(status.message);
          }
        });
      }
    }

    return Scaffold(
      backgroundColor: Colors.white,
      body: GetBuilder<AuthController>(builder: (authController) {
        return !authController.isLoading
            ? SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [
                    SizedBox(height: Dimensions.screenHeignt * 0.05),
                    // logo
                    SizedBox(
                      height: Dimensions.screenHeignt * 0.25,
                      child: const Center(
                        child: CircleAvatar(
                          radius: 80,
                          backgroundImage:
                              AssetImage('assets/image/logo_1.png'),
                          backgroundColor: Colors.white,
                        ),
                      ),
                    ),

                    // welcome
                    Container(
                      width: double.maxFinite,
                      margin: EdgeInsets.only(left: Dimensions.width20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Hello',
                            style: TextStyle(
                                color: AppColors.mainBlackColor,
                                fontSize: Dimensions.font20 * 4,
                                fontWeight: FontWeight.w500),
                          ),
                          RichText(
                            text: TextSpan(
                              text: 'Sign into your account',
                              style: TextStyle(
                                color: Colors.grey[500],
                                fontSize: Dimensions.font20,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    SizedBox(height: Dimensions.height20),

                    // form
                    // Phone
                    AppTextFieldWidget(
                      hintText: 'Phone',
                      textController: phoneController,
                      icon: Icons.phone,
                      iconColor: AppColors.mainColor,
                    ),

                    SizedBox(height: Dimensions.height20),
                    // Pass
                    AppTextFieldWidget(
                      hintText: 'Password',
                      textController: passController,
                      icon: Icons.password_sharp,
                      iconColor: AppColors.mainColor,
                      isObscure: true,
                    ),
                    SizedBox(height: Dimensions.height20),

                    // tag line
                    Container(
                      margin: EdgeInsets.only(right: Dimensions.width20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          RichText(
                            text: TextSpan(
                              text: 'Sign into your account',
                              style: TextStyle(
                                color: Colors.grey[500],
                                fontSize: Dimensions.font20,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    SizedBox(height: Dimensions.screenHeignt * 0.05),

                    // sign up button
                    GestureDetector(
                      onTap: () => login(authController),
                      child: Container(
                        width: Dimensions.screenWidth / 2,
                        height: Dimensions.screenHeignt / 13,
                        decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(Dimensions.radius30),
                          color: AppColors.mainColor,
                        ),
                        child: Center(
                          child: BigText(
                            text: 'Sign In',
                            size: Dimensions.font26,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),

                    SizedBox(height: Dimensions.screenHeignt * 0.05),
                    // sign up options
                    RichText(
                      text: TextSpan(
                          text: 'Don\'t have an account ? ',
                          style: TextStyle(
                            color: Colors.grey[500],
                            fontSize: Dimensions.font20,
                          ),
                          children: [
                            TextSpan(
                              recognizer: TapGestureRecognizer()
                                ..onTap = (() => Get.to(
                                      () => const SignUpPage(),
                                      transition: Transition.fade,
                                    )),
                              text: 'Create',
                              style: TextStyle(
                                  color: AppColors.mainBlackColor,
                                  fontSize: Dimensions.font20,
                                  fontWeight: FontWeight.w800),
                            )
                          ]),
                    ),
                  ],
                ),
              )
            : const CustomLoader();
      }),
    );
  }
}
