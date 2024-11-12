import 'package:flutter/material.dart';
import 'package:pricing_calculator/src/constants/app_sizes.dart';
import 'package:pricing_calculator/src/constants/colors.dart';

class CallToActionButton extends StatelessWidget {
  const CallToActionButton({
    super.key,
    required this.label,
    required this.onTap,
    this.color = AppColors.black,
    this.padding = const EdgeInsets.symmetric(
      horizontal: Sizes.p40,
      vertical: Sizes.p18,
    ),
    this.fixedSize,
  });

  final VoidCallback onTap;
  final Widget label;
  final Color color;
  final EdgeInsetsGeometry padding;
  final Size? fixedSize;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        padding: padding,
        fixedSize: fixedSize,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
      ),
      child: label,
    );
  }
}
