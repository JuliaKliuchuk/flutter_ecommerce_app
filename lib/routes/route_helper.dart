import 'package:flutter_ecommerce_app/pages/food/popular_food_detail.dart';
import 'package:flutter_ecommerce_app/pages/food/rerommended_food_detail.dart';
import 'package:flutter_ecommerce_app/pages/home/main_food_page.dart';
import 'package:get/get.dart';

class RouteHelper {
  static const String initial = '/';
  static const String popularFood = '/popular-food';
  static const String recommendedFood = '/recommended-food';

  static String getInitial() => initial;
  static String getPopularFood(int pageId) => '$popularFood?pageId=$pageId';
  static String getRecommendedFood() => recommendedFood;

  static List<GetPage> routes = [
    GetPage(name: '/', page: () => const MainFoodPage()),
    GetPage(
      name: popularFood,
      page: () {
        return const PopularFoodDetail();
      },
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: recommendedFood,
      page: () {
        return const RecommendedFoodDetail();
      },
      transition: Transition.fadeIn,
    ),
  ];
}
