import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/utils/colors.dart';
import 'package:flutter_ecommerce_app/utils/dimensions.dart';
import 'package:flutter_ecommerce_app/widgets/big_text.dart';

import '../../widgets/app_column.dart';
import '../../widgets/app_icon.dart';
import '../../widgets/expandable_text_widget.dart';

class PopularFoodDetail extends StatelessWidget {
  const PopularFoodDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            // background img
            Positioned(
              left: 0,
              right: 0,
              child: Container(
                width: double.maxFinite,
                height: Dimensions.popularFoodImgSize,
                decoration: const BoxDecoration(
                  color: Colors.amber,
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage('assets/image/food5.png'),
                  ),
                ),
              ),
            ),
            // header icons
            Positioned(
              top: Dimensions.height45,
              left: Dimensions.width20,
              right: Dimensions.width20,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  AppIcon(
                    icon: Icons.arrow_back_ios,
                  ),
                  AppIcon(
                    icon: Icons.shopping_cart_outlined,
                  ),
                ],
              ),
            ),
            // introducrion of food
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              top: Dimensions.popularFoodImgSize - 20,
              child: Container(
                padding: EdgeInsets.only(
                  left: Dimensions.width20,
                  right: Dimensions.width20,
                  top: Dimensions.height20,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(Dimensions.radius20),
                    bottomRight: Radius.circular(Dimensions.radius20),
                  ),
                  color: Colors.white,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const AppColumn(
                      text: 'Chinese Side',
                    ),
                    SizedBox(
                      height: Dimensions.height20,
                    ),
                    const BigText(text: 'Introduce'),
                    SizedBox(
                      height: Dimensions.height20,
                    ),
                    const Expanded(
                      child: SingleChildScrollView(
                        child: ExpandableTextWidget(
                            text:
                                'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Nibh nisl condimentum id venenatis a condimentum vitae. Sed risus ultricies tristique nulla aliquet enim tortor. Nec nam aliquam sem et tortor. Tellus orci ac auctor augue mauris augue neque gravida in. Et netus et malesuada fames. Netus et malesuada fames ac turpis. Neque volutpat ac tincidunt vitae semper quis lectus nulla. Urna porttitor rhoncus dolor purus non enim praesent elementum facilisis. Lectus proin nibh nisl condimentum id venenatis a condimentum vitae. Sed arcu non odio euismod lacinia at quis risus. Et sollicitudin ac orci phasellus egestas tellus rutrum. Tincidunt ornare massa eget egestas purus viverra accumsan. Fusce id velit ut tortor pretium viverra. Varius sit amet mattis vulputate enim. Dui accumsan sit amet nulla facilisi. Urna duis convallis convallis tellus. Malesuada fames ac turpis egestas. In massa tempor nec feugiat. Lorem donec massa sapien faucibus et. Sed ullamcorper morbi tincidunt ornare. Elit sed vulputate mi sit amet. Nulla aliquet porttitor lacus luctus accumsan. Velit scelerisque in dictum non. Enim diam vulputate ut pharetra sit amet aliquam id. Pharetra et ultrices neque ornare aenean.'),
                      ),
                    )
                  ],
                ),
              ),
            ),
            // expandable text
          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: Dimensions.bottomNavBarHeight,
        padding: EdgeInsets.only(
          top: Dimensions.height30,
          bottom: Dimensions.height30,
          left: Dimensions.width20,
          right: Dimensions.width20,
        ),
        decoration: BoxDecoration(
            color: AppColors.buttonBgColor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(Dimensions.radius20 * 2),
              topRight: Radius.circular(Dimensions.radius20 * 2),
            )),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: EdgeInsets.only(
                top: Dimensions.height20,
                bottom: Dimensions.height20,
                left: Dimensions.width20,
                right: Dimensions.width20,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.radius20),
                color: Colors.white,
              ),
              child: Row(
                children: [
                  const Icon(
                    Icons.remove,
                    color: AppColors.signColor,
                  ),
                  SizedBox(
                    width: Dimensions.width10 / 2,
                  ),
                  const BigText(text: '0'),
                  SizedBox(
                    width: Dimensions.width10 / 2,
                  ),
                  const Icon(
                    Icons.add,
                    color: AppColors.signColor,
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(
                top: Dimensions.height20,
                bottom: Dimensions.height20,
                left: Dimensions.width20,
                right: Dimensions.width20,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.radius20),
                color: AppColors.mainColor,
              ),
              child: const BigText(text: '\$10 | Add to cart'),
            )
          ],
        ),
      ),
    );
  }
}
