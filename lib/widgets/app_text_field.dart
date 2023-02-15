import 'package:flutter/material.dart';

import '../utils/colors.dart';
import '../utils/dimensions.dart';

class AppTextFieldWidget extends StatelessWidget {
  final TextEditingController textController;
  final String hintText;
  final IconData icon;
  final Color iconColor;

  final bool isObscure;

  const AppTextFieldWidget({
    super.key,
    required this.textController,
    required this.hintText,
    required this.icon,
    this.iconColor = AppColors.yellowColor,
    this.isObscure = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        left: Dimensions.height20,
        right: Dimensions.height20,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(Dimensions.radius15),
        boxShadow: [
          BoxShadow(
              blurRadius: 10,
              spreadRadius: 7,
              offset: const Offset(1, 1),
              color: Colors.grey.withOpacity(0.2))
        ],
      ),
      child: TextField(
        obscureText: isObscure,
        controller: textController,
        decoration: InputDecoration(
          hintText: hintText,
          prefixIcon: Icon(
            icon,
            color: iconColor,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(Dimensions.radius15),
            borderSide: const BorderSide(
              width: 1.0,
              color: Colors.white,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(Dimensions.radius15),
            borderSide: const BorderSide(
              width: 1.0,
              color: Colors.white,
            ),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(Dimensions.radius15),
          ),
        ),
      ),
    );
  }
}
