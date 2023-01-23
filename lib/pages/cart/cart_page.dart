import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/controllers/cart_controller.dart';
import 'package:flutter_ecommerce_app/controllers/popular_product_controller.dart';
import 'package:flutter_ecommerce_app/utils/colors.dart';
import 'package:flutter_ecommerce_app/utils/dimensions.dart';
import 'package:flutter_ecommerce_app/widgets/app_icon.dart';
import 'package:flutter_ecommerce_app/widgets/big_text.dart';
import 'package:flutter_ecommerce_app/widgets/small_text.dart';
import 'package:get/get.dart';

import '../../controllers/recommended_product_controller.dart';
import '../../routes/route_helper.dart';
import '../../utils/app_constants.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Positioned(
          top: Dimensions.height20 * 3,
          left: Dimensions.width20,
          right: Dimensions.width20,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                // onTap: () {
                //   Get.toNamed(RouteHelper.getInitial());
                // },
                child: AppIcon(
                  icon: Icons.arrow_back_ios,
                  iconColor: Colors.white,
                  bgColor: AppColors.mainColor,
                  iconSize: Dimensions.iconSize24,
                ),
              ),
              SizedBox(
                width: Dimensions.width20 * 5,
              ),
              GestureDetector(
                onTap: () {
                  Get.toNamed(RouteHelper.getInitial());
                },
                child: AppIcon(
                  icon: Icons.home_outlined,
                  iconColor: Colors.white,
                  bgColor: AppColors.mainColor,
                  iconSize: Dimensions.iconSize24,
                ),
              ),
              AppIcon(
                icon: Icons.shopping_cart,
                iconColor: Colors.white,
                bgColor: AppColors.mainColor,
                iconSize: Dimensions.iconSize24,
              ),
            ],
          ),
        ),
        Positioned(
          top: Dimensions.height20 * 5,
          left: Dimensions.width20,
          right: Dimensions.width20,
          bottom: 0,
          child: Container(
            margin: EdgeInsets.only(top: Dimensions.height15),
            child: MediaQuery.removePadding(
              context: context,
              removeTop: true,
              child: GetBuilder<CartController>(builder: (cartController) {
                var cartList = cartController.getItems;
                return ListView.builder(
                  itemCount: cartList.length,
                  itemBuilder: (context, index) {
                    return SizedBox(
                      height: Dimensions.height20 * 5,
                      width: double.maxFinite,
                      child: Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              var popularIndex =
                                  Get.find<PopularProductController>()
                                      .popularProductList
                                      .indexOf(cartList[index].product!);

                              if (popularIndex >= 0) {
                                Get.toNamed(RouteHelper.getPopularFood(
                                    popularIndex, 'cartPage'));
                              } else {
                                var recommendedIndex =
                                    Get.find<RecommendedProductController>()
                                        .recommendedProductList
                                        .indexOf(cartList[index].product!);

                                Get.toNamed(RouteHelper.getRecommendedFood(
                                    recommendedIndex, 'cartPage'));
                              }
                            },
                            child: Container(
                              height: Dimensions.height20 * 5,
                              width: Dimensions.height20 * 5,
                              margin:
                                  EdgeInsets.only(bottom: Dimensions.height10),
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.circular(Dimensions.radius20),
                                color: Colors.white,
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: NetworkImage(AppConstans.BASE_URL +
                                      AppConstans.UPLOAD_URL +
                                      cartList[index].img!),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: Dimensions.width10),
                          Expanded(
                              child: SizedBox(
                            height: Dimensions.height20 * 5,
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  BigText(
                                    text: cartList[index].name!,
                                    color: Colors.black54,
                                  ),
                                  const SmallText(text: 'Spicy'),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      BigText(
                                        text:
                                            '\$${cartList[index].price!.toString()}',
                                        color: Colors.redAccent,
                                      ),
                                      Container(
                                        padding: EdgeInsets.only(
                                          top: Dimensions.height10,
                                          bottom: Dimensions.height10,
                                          left: Dimensions.width10,
                                          right: Dimensions.width10,
                                        ),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                              Dimensions.radius20),
                                          color: Colors.white,
                                        ),
                                        child: Row(
                                          children: [
                                            GestureDetector(
                                              onTap: () {
                                                cartController.addItem(
                                                  cartList[index].product!,
                                                  -1,
                                                );
                                              },
                                              child: const Icon(
                                                Icons.remove,
                                                color: AppColors.signColor,
                                              ),
                                            ),
                                            SizedBox(
                                              width: Dimensions.width10,
                                            ),
                                            BigText(
                                                text: cartList[index]
                                                    .quantity
                                                    .toString()),
                                            SizedBox(
                                              width: Dimensions.width10,
                                            ),
                                            GestureDetector(
                                              onTap: () {
                                                cartController.addItem(
                                                  cartList[index].product!,
                                                  1,
                                                );
                                              },
                                              child: const Icon(
                                                Icons.add,
                                                color: AppColors.signColor,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ]),
                          ))
                        ],
                      ),
                    );
                  },
                );
              }),
            ),
          ),
        ),
      ]),
    );
  }
}
