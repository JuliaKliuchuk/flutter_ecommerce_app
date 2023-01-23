import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/models/products_model.dart';
import 'package:flutter_ecommerce_app/routes/route_helper.dart';
import 'package:flutter_ecommerce_app/utils/app_constants.dart';
import 'package:flutter_ecommerce_app/utils/colors.dart';
import 'package:flutter_ecommerce_app/widgets/big_text.dart';
import 'package:flutter_ecommerce_app/widgets/small_text.dart';
import 'package:get/get.dart';

import '../../controllers/popular_product_controller.dart';
import '../../controllers/recommended_product_controller.dart';
import '../../utils/dimensions.dart';
import '../../widgets/app_column.dart';
import '../../widgets/icon_and_text_widgets.dart';

class FoodPageBody extends StatefulWidget {
  const FoodPageBody({super.key});

  @override
  State<FoodPageBody> createState() => _FoodPageBodyState();
}

class _FoodPageBodyState extends State<FoodPageBody> {
  final PageController _pageController = PageController(viewportFraction: 0.85);
  var _currPageValue = 0.0;
  final double _scaleFactor = 0.8;
  final double _height = Dimensions.pageViewContainer;

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      setState(() {
        _currPageValue = _pageController.page!;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // slider popular food
        GetBuilder<PopularProductController>(builder: (popularProducts) {
          return popularProducts.isLoaded
              ? SizedBox(
                  height: Dimensions.pageView,
                  child: PageView.builder(
                    controller: _pageController,
                    itemCount: popularProducts.popularProductList.length,
                    itemBuilder: (context, position) {
                      return _buildPageItem(position,
                          popularProducts.popularProductList[position]);
                    },
                  ),
                )
              : SizedBox(
                  height: Dimensions.pageView,
                  child: const Center(
                    child: CircularProgressIndicator(
                      color: AppColors.mainColor,
                    ),
                  ));
        }),

        // dots
        GetBuilder<PopularProductController>(builder: (popularProducts) {
          return popularProducts.isLoaded
              ? DotsIndicator(
                  dotsCount: popularProducts.popularProductList.isEmpty
                      ? 1
                      : popularProducts.popularProductList.length,
                  position: _currPageValue,
                  decorator: DotsDecorator(
                    activeColor: AppColors.mainColor,
                    size: const Size.square(9.0),
                    activeSize: const Size(18.0, 9.0),
                    activeShape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0)),
                  ),
                  // onTap: (position) {
                  //   setState(() {
                  //     _currPageValue = position;
                  //   });
                  // },
                )
              : SizedBox(
                  height: Dimensions.height20,
                );
        }),

        // title list
        Container(
          margin: EdgeInsets.only(
            left: Dimensions.width30,
            bottom: Dimensions.height20,
            top: Dimensions.height20,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const BigText(text: 'Recommended'),
              SizedBox(
                width: Dimensions.width10,
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 3),
                child: const BigText(
                  text: '.',
                  color: Colors.black26,
                ),
              ),
              SizedBox(
                width: Dimensions.width10,
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 2),
                child: const SmallText(text: 'Food pairing'),
              )
            ],
          ),
        ),

        // list recommended products
        GetBuilder<RecommendedProductController>(
            builder: (recommendedProducts) {
          return recommendedProducts.isLoaded
              ? ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: recommendedProducts.recommendedProductList.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Get.toNamed(
                            RouteHelper.getRecommendedFood(index, 'home'));
                      },
                      child: Container(
                        margin: EdgeInsets.only(
                            left: Dimensions.width20,
                            right: Dimensions.width20,
                            bottom: Dimensions.height10),
                        child: Row(
                          children: [
                            // image section
                            Container(
                              width: Dimensions.listViewImgSize,
                              height: Dimensions.listViewImgSize,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadiusDirectional.circular(
                                    Dimensions.font20),
                                color: AppColors.mainColor,
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: NetworkImage(AppConstans.BASE_URL +
                                      AppConstans.UPLOAD_URL +
                                      recommendedProducts
                                          .recommendedProductList[index].img!),
                                ),
                              ),
                            ),
                            // text section
                            Expanded(
                              child: Container(
                                height: Dimensions.listViewITextSize,
                                padding: EdgeInsets.only(
                                  left: Dimensions.width10,
                                  right: Dimensions.width10,
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    topRight:
                                        Radius.circular(Dimensions.radius20),
                                    bottomRight:
                                        Radius.circular(Dimensions.radius20),
                                  ),
                                  color: Colors.white,
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    BigText(
                                        text:
                                            '${recommendedProducts.recommendedProductList[index].name!}'),
                                    SizedBox(
                                      height: Dimensions.height10,
                                    ),
                                    SmallText(
                                        text:
                                            '${recommendedProducts.recommendedProductList[index].name!}'),
                                    SizedBox(
                                      height: Dimensions.height10,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: const [
                                        IconAndTextWidget(
                                          icon: Icons.circle_sharp,
                                          text: 'Normal',
                                          iconColor: AppColors.iconColor1,
                                        ),
                                        IconAndTextWidget(
                                          icon: Icons.location_on,
                                          text: '1.7km',
                                          iconColor: AppColors.mainColor,
                                        ),
                                        IconAndTextWidget(
                                          icon: Icons.access_time_rounded,
                                          text: '32min',
                                          iconColor: AppColors.iconColor2,
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                )
              : const Center(
                  child: CircularProgressIndicator(
                    color: AppColors.mainColor,
                  ),
                );
        })
      ],
    );
  }

  Widget _buildPageItem(int index, ProductModel popularProduct) {
    //carousel customization (change card size)
    Matrix4 matrix = Matrix4.identity();

    if (index == _currPageValue.floor()) {
      var currScale = 1 - (_currPageValue - index) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else if (index == _currPageValue.floor() + 1) {
      var currScale =
          _scaleFactor + (_currPageValue - index + 1) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1);
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else if (index == _currPageValue.floor() - 1) {
      var currScale = 1 - (_currPageValue - index) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1);
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else {
      var currScale = 0.8;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, _height * (1 - _scaleFactor) / 2, 1);
    }

    return Transform(
      transform: matrix,
      child: Stack(children: [
        GestureDetector(
          onTap: () {
            Get.toNamed(RouteHelper.getPopularFood(index, 'home'));
          },
          child: Container(
            height: Dimensions.pageViewContainer,
            margin: EdgeInsets.only(
              left: Dimensions.width10,
              right: Dimensions.width10,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(Dimensions.radius30),
              color: AppColors.mainColor,
              image: DecorationImage(
                image: NetworkImage(AppConstans.BASE_URL +
                    AppConstans.UPLOAD_URL +
                    popularProduct.img!),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: Dimensions.pageViewTextContainer,
            margin: EdgeInsets.only(
                left: Dimensions.width30,
                right: Dimensions.width30,
                bottom: Dimensions.height30),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(Dimensions.radius20),
              color: Colors.white,
              boxShadow: const [
                BoxShadow(
                  color: Color(0xFFe8e8e8),
                  blurRadius: 5.0,
                  offset: Offset(0, 5),
                ),
                BoxShadow(
                  color: Colors.white,
                  offset: Offset(-5, 0),
                ),
                BoxShadow(
                  color: Colors.white,
                  offset: Offset(5, 0),
                ),
              ],
            ),
            child: Container(
              padding: EdgeInsets.only(
                  top: Dimensions.height10,
                  left: Dimensions.width15,
                  right: Dimensions.width15),
              child: AppColumn(
                text: popularProduct.name!,
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
