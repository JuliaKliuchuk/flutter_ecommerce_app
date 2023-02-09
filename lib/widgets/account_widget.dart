import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/utils/dimensions.dart';
import 'package:flutter_ecommerce_app/widgets/big_text.dart';

import 'app_icon.dart';

class AccountWidget extends StatelessWidget {
  final AppIcon icon;
  final BigText text;

  const AccountWidget({
    super.key,
    required this.icon,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        left: Dimensions.width20,
        top: Dimensions.height10,
        bottom: Dimensions.height10,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
              blurRadius: 1,
              offset: const Offset(0, 2),
              color: Colors.grey.withOpacity(0.2)),
        ],
      ),
      child: Row(
        children: [
          icon,
          SizedBox(width: Dimensions.width20),
          text,
        ],
      ),
    );
  }
}
