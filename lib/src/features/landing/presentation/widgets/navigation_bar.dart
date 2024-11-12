import 'package:flutter/material.dart';
import 'package:pricing_calculator/src/constants/app_sizes.dart';
import 'package:pricing_calculator/src/constants/colors.dart';
import 'package:pricing_calculator/src/shared/container_widget.dart';
import 'package:pricing_calculator/src/utilities/device_extensions.dart';

class NavigationBarWidget extends StatelessWidget {
  const NavigationBarWidget({
    super.key,
    required this.destinations,
  });
  final List<Widget> destinations;
  @override
  Widget build(BuildContext context) {
    return ContainerWidget(
      color: AppColors.white,
      padding: EdgeInsets.symmetric(
        horizontal: context.isDesktop ? Sizes.p60 : Sizes.p20,
        vertical: Sizes.p20,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: destinations,
      ),
    );
  }
}
