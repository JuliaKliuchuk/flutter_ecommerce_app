import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/widgets/account_widget.dart';
import 'package:flutter_ecommerce_app/widgets/big_text.dart';

import '../../utils/colors.dart';
import '../../utils/dimensions.dart';
import '../../widgets/app_icon.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
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
      body: Container(
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
                      text: const BigText(text: 'Name'),
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
                      text: const BigText(text: '+375 (29) 123 - 45 - 67'),
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
                      text: const BigText(text: 'test@gmail.com'),
                    ),
                    SizedBox(height: Dimensions.height20),

                    // adress
                    AccountWidget(
                      icon: AppIcon(
                        icon: Icons.location_on,
                        bgColor: AppColors.yellowColor,
                        iconColor: Colors.white,
                        iconSize: Dimensions.height10 * 5 / 2,
                        size: Dimensions.height10 * 5,
                      ),
                      text: const BigText(text: 'Fill in your adress'),
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
                      text: const BigText(text: 'Some message'),
                    ),
                    SizedBox(height: Dimensions.height20),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
