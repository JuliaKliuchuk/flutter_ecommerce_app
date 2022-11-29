import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/utils/dimentions.dart';

import '../utils/colors.dart';
import '../widgets/big_text.dart';
import '../widgets/small_text.dart';
import 'food_page_body.dart';

class MainFoodPage extends StatefulWidget {
  const MainFoodPage({super.key});

  @override
  State<MainFoodPage> createState() => _MainFoodPageState();
}

class _MainFoodPageState extends State<MainFoodPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // header
            Container(
              padding: EdgeInsets.only(
                  left: Dementions.width20, right: Dementions.width20),
              margin: EdgeInsets.only(
                  top: Dementions.height15, bottom: Dementions.height15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      const BigText(
                        text: 'Belarus',
                        color: AppColors.mainColor,
                      ),
                      Row(
                        children: const [
                          SmallText(
                            text: 'Minsk',
                            color: Colors.black54,
                          ),
                          Icon(Icons.arrow_drop_down_rounded)
                        ],
                      ),
                    ],
                  ),
                  Container(
                    width: Dementions.height45,
                    height: Dementions.height45,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Dementions.radius15),
                      color: AppColors.mainColor,
                    ),
                    child: Icon(
                      Icons.search,
                      color: Colors.white,
                      size: Dementions.iconSize24,
                    ),
                  ),
                ],
              ),
            ),
            //carusel
            const FoodPageBody(),
          ],
        ),
      ),
    );
  }
}
