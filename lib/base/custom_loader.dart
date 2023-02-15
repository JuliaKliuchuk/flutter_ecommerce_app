import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/utils/colors.dart';
import 'package:flutter_ecommerce_app/utils/dimensions.dart';

class CustomLoader extends StatelessWidget {
  const CustomLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: Dimensions.height20 * 5,
        width: Dimensions.width20 * 5,
        alignment: Alignment.center,
        child: const CircularProgressIndicator(
          color: AppColors.mainColor,
        ),
      ),
    );
  }
}
