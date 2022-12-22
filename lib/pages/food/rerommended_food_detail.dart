import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/utils/colors.dart';
import 'package:flutter_ecommerce_app/utils/dimensions.dart';
import 'package:flutter_ecommerce_app/widgets/app_icon.dart';
import 'package:flutter_ecommerce_app/widgets/big_text.dart';
import 'package:flutter_ecommerce_app/widgets/expandable_text_widget.dart';
import 'package:get/get.dart';

import '../../routes/route_helper.dart';

class RecommendedFoodDetail extends StatelessWidget {
  const RecommendedFoodDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              automaticallyImplyLeading: false,
              toolbarHeight: 80,
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      Get.toNamed(RouteHelper.getInitial());
                    },
                    child: const AppIcon(
                      icon: Icons.clear,
                    ),
                  ),
                  const AppIcon(
                    icon: Icons.shopping_cart_outlined,
                  ),
                ],
              ),
              bottom: PreferredSize(
                preferredSize: const Size.fromHeight(20),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(Dimensions.radius20),
                      topLeft: Radius.circular(Dimensions.radius20),
                    ),
                    color: Colors.white,
                  ),
                  width: double.maxFinite,
                  padding: const EdgeInsets.only(top: 5, bottom: 10),
                  child: Center(
                    child: BigText(
                      text: 'Sliver app bar',
                      size: Dimensions.font26,
                    ),
                  ),
                ),
              ),
              expandedHeight: 300,
              pinned: true,
              backgroundColor: AppColors.yellowColor,
              flexibleSpace: FlexibleSpaceBar(
                background: Image.asset(
                  'assets/image/food4.png',
                  width: double.maxFinite,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SliverToBoxAdapter(
                child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(
                    left: Dimensions.width20,
                    right: Dimensions.width20,
                    top: Dimensions.height10,
                    bottom: Dimensions.height20,
                  ),
                  child: const ExpandableTextWidget(
                      text:
                          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Nibh nisl condimentum id venenatis a condimentum vitae. Sed risus ultricies tristique nulla aliquet enim tortor. Nec nam aliquam sem et tortor. Tellus orci ac auctor augue mauris augue neque gravida in. Et netus et malesuada fames. Netus et malesuada fames ac turpis. Neque volutpat ac tincidunt vitae semper quis lectus nulla. Urna porttitor rhoncus dolor purus non enim praesent elementum facilisis. Lectus proin nibh nisl condimentum id venenatis a condimentum vitae. Sed arcu non odio euismod lacinia at quis risus. Et sollicitudin ac orci phasellus egestas tellus rutrum. Tincidunt ornare massa eget egestas purus viverra accumsan. Fusce id velit ut tortor pretium viverra. Varius sit amet mattis vulputate enim. Dui accumsan sit amet nulla facilisi. Urna duis convallis convallis tellus. Malesuada fames ac turpis egestas. In massa tempor nec feugiat. Lorem donec massa sapien faucibus et. Sed ullamcorper morbi tincidunt ornare. Elit sed vulputate mi sit amet. Nulla aliquet porttitor lacus luctus accumsan. Velit scelerisque in dictum non. Enim diam vulputate ut pharetra sit amet aliquam id. Pharetra et ultrices neque ornare aenean.Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Nibh nisl condimentum id venenatis a condimentum vitae. Sed risus ultricies tristique nulla aliquet enim tortor. Nec nam aliquam sem et tortor. Tellus orci ac auctor augue mauris augue neque gravida in. Et netus et malesuada fames. Netus et malesuada fames ac turpis. Neque volutpat ac tincidunt vitae semper quis lectus nulla. Urna porttitor rhoncus dolor purus non enim praesent elementum facilisis. Lectus proin nibh nisl condimentum id venenatis a condimentum vitae. Sed arcu non odio euismod lacinia at quis risus. Et sollicitudin ac orci phasellus egestas tellus rutrum. Tincidunt ornare massa eget egestas purus viverra accumsan. Fusce id velit ut tortor pretium viverra. Varius sit amet mattis vulputate enim. Dui accumsan sit amet nulla facilisi. Urna duis convallis convallis tellus. Malesuada fames ac turpis egestas. In massa tempor nec feugiat. Lorem donec massa sapien faucibus et. Sed ullamcorper morbi tincidunt ornare. Elit sed vulputate mi sit amet. Nulla aliquet porttitor lacus luctus accumsan. Velit scelerisque in dictum non. Enim diam vulputate ut pharetra sit amet aliquam id. Pharetra et ultrices neque ornare aenean.Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Nibh nisl condimentum id venenatis a condimentum vitae. Sed risus ultricies tristique nulla aliquet enim tortor. Nec nam aliquam sem et tortor. Tellus orci ac auctor augue mauris augue neque gravida in. Et netus et malesuada fames. Netus et malesuada fames ac turpis. Neque volutpat ac tincidunt vitae semper quis lectus nulla. Urna porttitor rhoncus dolor purus non enim praesent elementum facilisis. Lectus proin nibh nisl condimentum id venenatis a condimentum vitae. Sed arcu non odio euismod lacinia at quis risus. Et sollicitudin ac orci phasellus egestas tellus rutrum. Tincidunt ornare massa eget egestas purus viverra accumsan. Fusce id velit ut tortor pretium viverra. Varius sit amet mattis vulputate enim. Dui accumsan sit amet nulla facilisi. Urna duis convallis convallis tellus. Malesuada fames ac turpis egestas. In massa tempor nec feugiat. Lorem donec massa sapien faucibus et. Sed ullamcorper morbi tincidunt ornare. Elit sed vulputate mi sit amet. Nulla aliquet porttitor lacus luctus accumsan. Velit scelerisque in dictum non. Enim diam vulputate ut pharetra sit amet aliquam id. Pharetra et ultrices neque ornare aenean.Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Nibh nisl condimentum id venenatis a condimentum vitae. Sed risus ultricies tristique nulla aliquet enim tortor. Nec nam aliquam sem et tortor. Tellus orci ac auctor augue mauris augue neque gravida in. Et netus et malesuada fames. Netus et malesuada fames ac turpis. Neque volutpat ac tincidunt vitae semper quis lectus nulla. Urna porttitor rhoncus dolor purus non enim praesent elementum facilisis. Lectus proin nibh nisl condimentum id venenatis a condimentum vitae. Sed arcu non odio euismod lacinia at quis risus. Et sollicitudin ac orci phasellus egestas tellus rutrum. Tincidunt ornare massa eget egestas purus viverra accumsan. Fusce id velit ut tortor pretium viverra. Varius sit amet mattis vulputate enim. Dui accumsan sit amet nulla facilisi. Urna duis convallis convallis tellus. Malesuada fames ac turpis egestas. In massa tempor nec feugiat. Lorem donec massa sapien faucibus et. Sed ullamcorper morbi tincidunt ornare. Elit sed vulputate mi sit amet. Nulla aliquet porttitor lacus luctus accumsan. Velit scelerisque in dictum non. Enim diam vulputate ut pharetra sit amet aliquam id. Pharetra et ultrices neque ornare aenean'),
                ),
              ],
            ))
          ],
        ),
      ),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: EdgeInsets.only(
              left: Dimensions.width20 * 2.5,
              right: Dimensions.width20 * 2.5,
              top: Dimensions.height10,
              bottom: Dimensions.height10,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppIcon(
                  icon: Icons.remove,
                  bgColor: AppColors.mainColor,
                  iconColor: Colors.white,
                  iconSize: Dimensions.iconSize24,
                ),
                BigText(
                  text: '\$12.88 X 0',
                  color: AppColors.mainBlackColor,
                  size: Dimensions.font26,
                ),
                AppIcon(
                  icon: Icons.add,
                  bgColor: AppColors.mainColor,
                  iconColor: Colors.white,
                  iconSize: Dimensions.iconSize24,
                ),
              ],
            ),
          ),
          Container(
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
                  child: const Icon(
                    Icons.favorite,
                    color: AppColors.mainColor,
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
                  child: const BigText(
                    text: '\$28 | Add to cart',
                    color: Colors.white,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
