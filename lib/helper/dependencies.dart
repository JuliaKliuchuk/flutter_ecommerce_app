import 'package:flutter_ecommerce_app/controllers/auth_controller.dart';
import 'package:flutter_ecommerce_app/data/api/api_client.dart';
import 'package:flutter_ecommerce_app/data/repository/auth_repo.dart';
import 'package:flutter_ecommerce_app/utils/app_constants.dart';
import 'package:get/get.dart';

import 'package:flutter_ecommerce_app/data/repository/popular_product_repo.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../controllers/cart_controller.dart';
import '../data/repository/cart_repo.dart';
import '../data/repository/recommended_product_repo.dart';

import '../controllers/popular_product_controller.dart';
import '../controllers/recommended_product_controller.dart';

Future<void> init() async {
  final sharedPreferences = await SharedPreferences.getInstance();

  Get.lazyPut(() => sharedPreferences);

  // api client
  Get.lazyPut(() => ApiClient(appBaseUrl: AppConstans.BASE_URL));
  Get.lazyPut(() => AuthRepo(
        apiClient: Get.find(),
        sharedPreferences: Get.find(),
      ));

  // repository
  Get.lazyPut(() => PopularProductRepo(apiClient: Get.find()));
  Get.lazyPut(() => RecommendedProductRepo(apiClient: Get.find()));
  Get.lazyPut(() => CartRepo(sharedPreferences: Get.find()));

  // controllers
  Get.lazyPut(() => PopularProductController(popularProductRepo: Get.find()));
  Get.lazyPut(
      () => RecommendedProductController(recommendedProductRepo: Get.find()));
  Get.lazyPut(() => CartController(cartRepo: Get.find()));
  Get.lazyPut(() => AuthController(authRepo: Get.find()));
}
