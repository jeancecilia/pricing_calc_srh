import 'package:flutter/widgets.dart';
import 'package:pricing_calculator/src/constants/app_sizes.dart';
import 'package:pricing_calculator/src/constants/colors.dart';
import 'package:pricing_calculator/src/shared/container_widget.dart';
import 'package:pricing_calculator/src/utilities/device_extensions.dart';

class FeatureCard extends StatelessWidget {
  final String? title;
  final String? description;
  final String? image;
  final int index;

  const FeatureCard({
    super.key,
    required this.title,
    required this.description,
    required this.index,
    this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: context.isTabletOrLess
            ? Sizes.p20
            : (index == 1 || index == 2 || index == 5 ? 0 : Sizes.p73),
        vertical: context.isTabletOrLess
            ? Sizes.p20
            : (index == 1 || index == 2 || index == 5 ? 0 : Sizes.p60),
      ),
      decoration: BoxDecoration(
        color: context.isTabletOrLess
            ? AppColors.white
            : index == 1 || index == 2 || index == 5
                ? AppColors.lightGrey
                : AppColors.white,
      ),
      child: context.isDesktop && (index == 1 || index == 2 || index == 5)
          ? Image.asset(
              image ?? '',
              fit: BoxFit.cover,
            )
          : Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title ?? "",
                  style: TextStyle(
                    fontSize: context.isTabletOrLess ? Sizes.p20 : Sizes.p32,
                    fontWeight: FontWeight.bold,
                    color: AppColors.black,
                  ),
                ),
                context.isTabletOrLess ? gapH20 : gapH48,
                ContainerWidget(
                  padding: const EdgeInsets.all(Sizes.p18),
                  border: const Border(
                    left: BorderSide(color: AppColors.black, width: 2),
                  ),
                  child: SizedBox(
                    width: 550,
                    child: Text(
                      description ?? "",
                      style: TextStyle(
                        fontSize:
                            context.isTabletOrLess ? Sizes.p14 : Sizes.p24,
                        color: AppColors.textSecondary,
                        height: 1.5,
                      ),
                    ),
                  ),
                ),
              ],
            ),
    );
  }
}
