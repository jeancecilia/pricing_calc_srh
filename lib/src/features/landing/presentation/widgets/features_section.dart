// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pricing_calculator/i18n/strings.g.dart';
import 'package:pricing_calculator/src/constants/app_sizes.dart';
import 'package:pricing_calculator/src/constants/colors.dart';
import 'package:pricing_calculator/src/features/landing/presentation/widgets/features_grid.dart';
import 'package:pricing_calculator/src/shared/container_widget.dart';
import 'package:pricing_calculator/src/shared/text_widget.dart';
import 'package:pricing_calculator/src/utilities/device_extensions.dart';
import 'package:pricing_calculator/src/utilities/navigator_utils.dart';

class FeaturesSection extends HookConsumerWidget {
  const FeaturesSection({super.key, required this.index});
  final int index;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final t = Translations.of(context);
    return ContainerWidget(
      color: AppColors.white,
      key: NavigationUtilities.keys[index],
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          gapH64,
          TextWidget(
            text: t.landing.features_title,
            fontSize: context.isTabletOrLess ? Sizes.p20 : Sizes.p32,
            fontWeight: FontWeight.w500,
          ),
          gapH8,
          SizedBox(
            width: 850,
            child: TextWidget(
              textAlign: TextAlign.center,
              text: t.landing.feature_subtitle,
              color: AppColors.blueGrey,
              fontSize: context.isTabletOrLess ? Sizes.p14 : Sizes.p18,
            ),
          ),
          gapH40,
          const FeatureGrid()
        ],
      ),
    );
  }
}
