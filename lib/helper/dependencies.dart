import 'package:flutter_ecommerce_app/data/api/api_client.dart';
import 'package:flutter_ecommerce_app/utils/app_constants.dart';
import 'package:get/get.dart';

import 'package:flutter_ecommerce_app/data/repository/popular_product_repo.dart';
import '../data/repository/recommended_product_repo.dart';

import '../controllers/popular_product_controller copy.dart';
import '../controllers/recommended_product_controller copy.dart';

Future<void> init() async {
  // api client
  Get.lazyPut(() => ApiClient(appBaseUrl: AppConstans.BASE_URL));

  // repository
  Get.lazyPut(() => PopularProductRepo(apiClient: Get.find()));
  Get.lazyPut(() => RecommendedProductRepo(apiClient: Get.find()));

  // controllers
  Get.lazyPut(() => PopularProductController(popularProductRepo: Get.find()));
  Get.lazyPut(
      () => RecommendedProductController(recommendedProductRepo: Get.find()));
}
