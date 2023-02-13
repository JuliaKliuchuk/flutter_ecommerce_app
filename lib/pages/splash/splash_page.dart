import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/controllers/popular_product_controller.dart';
import 'package:flutter_ecommerce_app/controllers/recommended_product_controller.dart';
import 'package:flutter_ecommerce_app/routes/route_helper.dart';
import 'package:flutter_ecommerce_app/utils/dimensions.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController controller;

  Future<void> _loadResource() async {
    await Get.find<PopularProductController>().getPopularProductList();
    await Get.find<RecommendedProductController>().getRecommendedProductList();
  }

  @override
  void initState() {
    super.initState();
    _loadResource();

    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..forward();

    animation = CurvedAnimation(
      parent: controller,
      curve: Curves.linear,
    );

    Timer(
      const Duration(seconds: 3),
      () => Get.toNamed(RouteHelper.getInitial()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ScaleTransition(
            scale: animation,
            child: Center(
              child: Image.asset(
                'assets/image/logo_1.png',
                width: Dimensions.splashImg,
              ),
            ),
          ),
          // const BigText(
          //   text: 'The Best Food',
          //   size: 30,
          //   color: AppColors.mainColor,
          // ),

          Image.asset(
            'assets/image/logo_2.png',
            width: Dimensions.splashImg,
          )
        ],
      ),
    );
  }
}
