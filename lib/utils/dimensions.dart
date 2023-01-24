import 'package:get/get.dart';

class Dimensions {
  static double screenHeignt = Get.context!.height;
  static double screenWidth = Get.context!.width;

  static double pageView = screenHeignt / 2.64;
  static double pageViewContainer = screenHeignt / 3.84;
  static double pageViewTextContainer = screenHeignt / 7.03;

// dynamic height padding and margin
  static double height10 = screenHeignt / 84.4;
  static double height15 = screenHeignt / 56.27;
  static double height20 = screenHeignt / 42.2;
  static double height30 = screenHeignt / 28.13;
  static double height45 = screenHeignt / 18.76;

  // dynamic width  padding and margin
  static double width10 = screenHeignt / 84.4;
  static double width15 = screenHeignt / 56.27;
  static double width20 = screenHeignt / 42.2;
  static double width30 = screenHeignt / 28.13;

  //font
  static double font16 = screenHeignt / 52.75;
  static double font20 = screenHeignt / 42.2;
  static double font26 = screenHeignt / 32.46;

  //radius
  static double radius15 = screenHeignt / 56.27;
  static double radius20 = screenHeignt / 42.2;
  static double radius30 = screenHeignt / 28.13;

  // icon size
  static double iconSize24 = screenHeignt / 35.17;
  static double iconSize16 = screenHeignt / 52.75;

  // list view size
  static double listViewImgSize = screenWidth / 3.25;
  static double listViewITextSize = screenWidth / 3.9;

  // popular food
  static double popularFoodImgSize = screenHeignt / 2.41;

  // height bottom nav bar
  static double bottomNavBarHeight = screenHeignt / 7.03;

  // splash screen dimensions
  static double splashImg = screenHeignt / 3.38;
}
