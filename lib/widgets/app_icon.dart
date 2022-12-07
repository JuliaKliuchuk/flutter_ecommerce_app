import 'package:flutter/material.dart';

class AppIcon extends StatelessWidget {
  final IconData icon;
  final Color bgColor;
  final Color iconColor;
  final double size;
  final double iconSize;

  const AppIcon({
    Key? key,
    required this.icon,
    this.bgColor = Colors.white,
    this.iconColor = Colors.grey,
    this.size = 40,
    this.iconSize = 16,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(size / 2),
        color: bgColor,
      ),
      child: Align(
        alignment: Alignment.center,
        child: Icon(
          icon,
          color: iconColor,
          size: iconSize,
        ),
      ),
    );
  }
}
