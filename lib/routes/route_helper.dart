import 'package:flutter_ecommerce_app/pages/auth/sign_in_page.dart';
import 'package:flutter_ecommerce_app/pages/food/popular_food_detail.dart';
import 'package:flutter_ecommerce_app/pages/food/rerommended_food_detail.dart';
import 'package:flutter_ecommerce_app/pages/splash/splash_page.dart';
import 'package:get/get.dart';

import '../pages/address/add_address_page.dart';
import '../pages/cart/cart_page.dart';
import '../pages/home/home_page.dart';

class RouteHelper {
  static const String splashScreen = '/splash-screen';
  static const String initial = '/';
  static const String popularFood = '/popular-food';
  static const String recommendedFood = '/recommended-food';
  static const String cartPage = '/cart-page';
  static const String signIn = '/sign-in';
  static const String addAddress = '/add-address';

  static String getSplashScreen() => splashScreen;
  static String getInitial() => initial;
  static String getPopularFood(int pageId, String? page) =>
      '$popularFood?pageId=$pageId&page=$page';
  static String getRecommendedFood(int pageId, String? page) =>
      '$recommendedFood?pageId=$pageId&page=$page';
  static String getCartPage() => cartPage;
  static String getSignInPage() => signIn;
  static String getAddressPage() => addAddress;

  static List<GetPage> routes = [
    // splashScreen
    GetPage(
      name: splashScreen,
      page: () => const SplashScreen(),
    ),

    // initial
    GetPage(
      name: initial,
      page: () => const HomePage(),
    ),

    // sign in
    GetPage(
      name: signIn,
      page: () => const SignInPage(),
      transition: Transition.fade,
    ),

    //popularFood
    GetPage(
      name: popularFood,
      page: () {
        var pageId = Get.parameters['pageId'];
        var page = Get.parameters['page'];
        return PopularFoodDetail(
          pageId: int.parse(pageId!),
          page: page!,
        );
      },
      transition: Transition.fadeIn,
    ),

    // recommendedFood
    GetPage(
      name: recommendedFood,
      page: () {
        var pageId = Get.parameters['pageId'];
        var page = Get.parameters['page'];

        return RecommendedFoodDetail(
          pageId: int.parse(pageId!),
          page: page!,
        );
      },
      transition: Transition.fadeIn,
    ),

    // cartPage
    GetPage(
      name: cartPage,
      page: () {
        return const CartPage();
      },
      transition: Transition.fadeIn,
    ),

    // add address
    GetPage(
      name: addAddress,
      page: () {
        return const AddAddressPage();
      },
      transition: Transition.fadeIn,
    ),
  ];
}
