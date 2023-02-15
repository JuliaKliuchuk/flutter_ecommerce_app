import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/controllers/auth_controller.dart';
import 'package:flutter_ecommerce_app/utils/dimensions.dart';
import 'package:get/get.dart';

import '../../base/custom_loader.dart';
import '../../base/show_custom_snack_bar.dart';
import '../../models/sign_up_model.dart';
import '../../utils/colors.dart';
import '../../widgets/app_text_field.dart';
import '../../widgets/big_text.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    var nameController = TextEditingController();
    var emailController = TextEditingController();
    var passController = TextEditingController();
    var phoneController = TextEditingController();

    var signUpImgs = ['t.png', 'f.png', 'g.png'];

    void registration(AuthController authController) {
      String name = nameController.text.trim();
      String phone = phoneController.text.trim();
      String email = emailController.text.trim();
      String password = passController.text.trim();

      if (name.isEmpty) {
        showCustomSnackBar(
          'Type in your name',
          title: 'Name',
        );
      } else if (phone.isEmpty) {
        showCustomSnackBar(
          'Type in your phone',
          title: 'Phone number',
        );
      } else if (email.isEmpty) {
        showCustomSnackBar(
          'Type in your email adress',
          title: 'Email adress',
        );
      } else if (!GetUtils.isEmail(email)) {
        showCustomSnackBar(
          'Type in a valid email adress',
          title: 'Valid email adress',
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

        SignUpModel signUpData = SignUpModel(
          name: name,
          phone: phone,
          email: email,
          password: password,
        );

        authController.registration(signUpData).then((status) {
          if (status.isSuccess) {
            print('Success registration');
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
                    // form
                    SizedBox(height: Dimensions.height20),
                    // Email
                    AppTextFieldWidget(
                      hintText: 'Email',
                      textController: emailController,
                      icon: Icons.email,
                    ),
                    SizedBox(height: Dimensions.height20),
                    // Pass
                    AppTextFieldWidget(
                      hintText: 'Password',
                      textController: passController,
                      icon: Icons.password_sharp,
                      isObscure: true,
                    ),
                    SizedBox(height: Dimensions.height20),
                    // Name
                    AppTextFieldWidget(
                      hintText: 'Name',
                      textController: nameController,
                      icon: Icons.person,
                    ),
                    SizedBox(height: Dimensions.height20),
                    // Phone
                    AppTextFieldWidget(
                      hintText: 'Phone',
                      textController: phoneController,
                      icon: Icons.phone,
                    ),
                    SizedBox(height: Dimensions.height20),

                    // sign up button
                    GestureDetector(
                      onTap: () {
                        registration(authController);
                      },
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
                            text: 'Sign Up',
                            size: Dimensions.font26,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),

                    SizedBox(height: Dimensions.height10),
                    // tag line
                    RichText(
                      text: TextSpan(
                        text: 'Have an account alredy? ',
                        style: TextStyle(
                          color: Colors.grey[500],
                          fontSize: Dimensions.font20,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = (() => Get.back()),
                      ),
                    ),

                    SizedBox(height: Dimensions.screenHeignt * 0.05),
                    // sign up options
                    RichText(
                      text: TextSpan(
                        text: 'Sig up using one of the following methods',
                        style: TextStyle(
                          color: Colors.grey[500],
                          fontSize: Dimensions.font16,
                        ),
                      ),
                    ),

                    // sign with ...
                    Wrap(
                      children: List.generate(
                          3,
                          (index) => Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: SizedBox(
                                  height: 50,
                                  width: 50,
                                  child: CircleAvatar(
                                    radius: Dimensions.radius30,
                                    backgroundColor: Colors.white,
                                    backgroundImage: AssetImage(
                                        'assets/image/${signUpImgs[index]}'),
                                  ),
                                ),
                              )),
                    ),
                  ],
                ),
              )
            : const CustomLoader();
      }),
    );
  }
}
