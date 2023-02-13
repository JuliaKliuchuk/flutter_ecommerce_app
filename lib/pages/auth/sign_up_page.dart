import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/utils/dimensions.dart';
import 'package:get/get.dart';

import '../../utils/colors.dart';
import '../../widgets/app_text_field.dart';
import '../../widgets/big_text.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    var passController = TextEditingController();
    var nameController = TextEditingController();
    var phoneController = TextEditingController();

    var signUpImgs = ['t.png', 'f.png', 'g.png'];

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
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
                  backgroundImage: AssetImage('assets/image/logo_1.png'),
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
            Container(
              width: Dimensions.screenWidth / 2,
              height: Dimensions.screenHeignt / 13,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.radius30),
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

            SizedBox(height: Dimensions.height10),
            // tag line
            RichText(
              text: TextSpan(
                text: 'Have an account alredy? ',
                style: TextStyle(
                  color: Colors.grey[500],
                  fontSize: Dimensions.font20,
                ),
                recognizer: TapGestureRecognizer()..onTap = (() => Get.back()),
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
                            backgroundImage:
                                AssetImage('assets/image/${signUpImgs[index]}'),
                          ),
                        ),
                      )),
            ),
          ],
        ),
      ),
    );
  }
}
