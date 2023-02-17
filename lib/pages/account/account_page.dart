import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/base/custom_loader.dart';
import 'package:flutter_ecommerce_app/controllers/auth_controller.dart';
import 'package:flutter_ecommerce_app/controllers/cart_controller.dart';
import 'package:flutter_ecommerce_app/controllers/user_controller.dart';
import 'package:flutter_ecommerce_app/routes/route_helper.dart';
import 'package:get/get.dart';

import 'package:flutter_ecommerce_app/widgets/account_widget.dart';
import 'package:flutter_ecommerce_app/widgets/big_text.dart';
import '../../utils/colors.dart';
import '../../utils/dimensions.dart';
import '../../widgets/app_icon.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    bool userLoggedIn = Get.find<AuthController>().userLoggedIn();
    Get.find<AuthController>().userLoggedIn();
    if (userLoggedIn) {
      Get.find<UserController>().getUserData();
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.mainColor,
        automaticallyImplyLeading: false,
        toolbarHeight: Dimensions.height10 * 8,
        centerTitle: true,
        title: const BigText(
          text: 'Profile',
          size: 24,
          color: Colors.white,
        ),
      ),
      body: GetBuilder<UserController>(builder: (userController) {
        return userLoggedIn
            ? (userController.isLoading
                ? Container(
                    width: double.maxFinite,
                    margin: EdgeInsets.only(top: Dimensions.height20),
                    child: Column(
                      children: [
                        // profile icon
                        AppIcon(
                          icon: Icons.person,
                          bgColor: AppColors.mainColor,
                          iconColor: Colors.white,
                          iconSize: Dimensions.height45 + Dimensions.height30,
                          size: Dimensions.height15 * 10,
                        ),
                        SizedBox(height: Dimensions.height30),

                        Expanded(
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                // name
                                AccountWidget(
                                  icon: AppIcon(
                                    icon: Icons.person,
                                    bgColor: AppColors.mainColor,
                                    iconColor: Colors.white,
                                    iconSize: Dimensions.height10 * 5 / 2,
                                    size: Dimensions.height10 * 5,
                                  ),
                                  text: BigText(
                                      text: userController.userModel.name),
                                ),
                                SizedBox(height: Dimensions.height20),

                                // phone
                                AccountWidget(
                                  icon: AppIcon(
                                    icon: Icons.phone,
                                    bgColor: AppColors.yellowColor,
                                    iconColor: Colors.white,
                                    iconSize: Dimensions.height10 * 5 / 2,
                                    size: Dimensions.height10 * 5,
                                  ),
                                  text: BigText(
                                      text: userController.userModel.phone),
                                ),
                                SizedBox(height: Dimensions.height20),

                                // email
                                AccountWidget(
                                  icon: AppIcon(
                                    icon: Icons.email,
                                    bgColor: AppColors.yellowColor,
                                    iconColor: Colors.white,
                                    iconSize: Dimensions.height10 * 5 / 2,
                                    size: Dimensions.height10 * 5,
                                  ),
                                  text: BigText(
                                      text: userController.userModel.email),
                                ),
                                SizedBox(height: Dimensions.height20),

                                // adress
                                GestureDetector(
                                  onTap: () =>
                                      Get.toNamed(RouteHelper.getAddressPage()),
                                  child: AccountWidget(
                                    icon: AppIcon(
                                      icon: Icons.location_on,
                                      bgColor: AppColors.yellowColor,
                                      iconColor: Colors.white,
                                      iconSize: Dimensions.height10 * 5 / 2,
                                      size: Dimensions.height10 * 5,
                                    ),
                                    text: const BigText(
                                        text: 'Fill in your adress'),
                                  ),
                                ),
                                SizedBox(height: Dimensions.height20),

                                // message
                                AccountWidget(
                                  icon: AppIcon(
                                    icon: Icons.message,
                                    bgColor: Colors.redAccent,
                                    iconColor: Colors.white,
                                    iconSize: Dimensions.height10 * 5 / 2,
                                    size: Dimensions.height10 * 5,
                                  ),
                                  text: const BigText(text: 'Messages'),
                                ),
                                SizedBox(height: Dimensions.height20),

                                // Logout
                                GestureDetector(
                                  onTap: () {
                                    if (Get.find<AuthController>()
                                        .userLoggedIn()) {
                                      Get.find<AuthController>()
                                          .clearSharedData();
                                      Get.find<CartController>().clear();
                                      Get.find<CartController>()
                                          .clearCartHistory();
                                      Get.offNamed(RouteHelper.getSignInPage());
                                    } else {}
                                  },
                                  child: AccountWidget(
                                    icon: AppIcon(
                                      icon: Icons.logout,
                                      bgColor: Colors.redAccent,
                                      iconColor: Colors.white,
                                      iconSize: Dimensions.height10 * 5 / 2,
                                      size: Dimensions.height10 * 5,
                                    ),
                                    text: const BigText(text: 'Logout'),
                                  ),
                                ),
                                SizedBox(height: Dimensions.height20),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                : const CustomLoader())
            : Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: double.maxFinite,
                      height: Dimensions.height20 * 8,
                      margin: EdgeInsets.only(
                          left: Dimensions.width20, right: Dimensions.width20),
                      decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.circular(Dimensions.radius20),
                        image: const DecorationImage(
                          fit: BoxFit.cover,
                          image:
                              AssetImage('assets/image/signintocontinue.png'),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.toNamed(RouteHelper.getSignInPage());
                      },
                      child: Container(
                          width: double.maxFinite,
                          height: Dimensions.height20 * 5,
                          margin: EdgeInsets.only(
                              left: Dimensions.width20,
                              right: Dimensions.width20),
                          decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.circular(Dimensions.radius20),
                          ),
                          child: Center(
                            child: BigText(
                              text: 'Sign in',
                              color: AppColors.mainColor,
                              size: Dimensions.font26,
                            ),
                          )),
                    ),
                  ],
                ),
              );
      }),
    );
  }
}
