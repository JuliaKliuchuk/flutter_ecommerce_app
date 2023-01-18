import 'package:flutter_ecommerce_app/data/api/api_client.dart';
import 'package:flutter_ecommerce_app/utils/app_constants.dart';
import 'package:get/get.dart';

import 'package:flutter_ecommerce_app/data/repository/popular_product_repo.dart';
import '../controllers/cart_controller.dart';
import '../data/repository/cart_repo.dart';
import '../data/repository/recommended_product_repo.dart';

import '../controllers/popular_product_controller.dart';
import '../controllers/recommended_product_controller.dart';

Future<void> init() async {
  // api client
  Get.lazyPut(() => ApiClient(appBaseUrl: AppConstans.BASE_URL));

  // repository
  Get.lazyPut(() => PopularProductRepo(apiClient: Get.find()));
  Get.lazyPut(() => RecommendedProductRepo(apiClient: Get.find()));
  Get.lazyPut(() => CartRepo());

  // controllers
  Get.lazyPut(() => PopularProductController(popularProductRepo: Get.find()));
  Get.lazyPut(
      () => RecommendedProductController(recommendedProductRepo: Get.find()));
  Get.lazyPut(() => CartController(cartRepo: Get.find()));
}
