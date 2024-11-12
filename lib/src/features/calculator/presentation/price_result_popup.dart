import 'package:flutter/widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pricing_calculator/i18n/strings.g.dart';
import 'package:pricing_calculator/src/constants/app_sizes.dart';
import 'package:pricing_calculator/src/constants/colors.dart';
import 'package:pricing_calculator/src/shared/container_widget.dart';
import 'package:pricing_calculator/src/shared/text_widget.dart';
import 'package:pricing_calculator/src/utilities/device_extensions.dart';

class PriceResultPopup extends HookConsumerWidget {
  const PriceResultPopup({
    super.key,
    required this.totalFixed,
    required this.totalVariable,
    required this.profitMargin,
  });

  final double totalFixed;
  final double totalVariable;
  final double profitMargin;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final t = Translations.of(context);
    return ContainerWidget(
      borderRadius: BorderRadius.circular(20),
      color: AppColors.whitishGray,
      padding: EdgeInsets.all(
        context.isTabletOrLess ? Sizes.p14 : Sizes.p60,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          TextWidget(
            text: t.yourPriceSuggestion,
            fontSize: context.isTabletOrLess ? Sizes.p20 : Sizes.p32,
          ),
          gapH20,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ContainerWidget(
                borderRadius: BorderRadius.circular(10),
                color: AppColors.white,
                padding: const EdgeInsets.all(Sizes.p20),
                width: 500,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextWidget(
                      text:
                          "€${((totalFixed + totalVariable) * (1 + profitMargin)).round()}",
                      fontSize: context.isTabletOrLess ? Sizes.p20 : Sizes.p32,
                    ),
                    TextWidget(
                      text: t.perUnit,
                      fontSize: Sizes.p16,
                    ),
                  ],
                ),
              ),
              gapH20,
              ContainerWidget(
                borderRadius: BorderRadius.circular(10),
                color: AppColors.white,
                padding: const EdgeInsets.all(Sizes.p20),
                width: 500,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextWidget(
                          text: t.landing.fixed_cost,
                          fontSize: Sizes.p16,
                        ),
                        TextWidget(
                          text: "€$totalFixed",
                          fontSize: Sizes.p16,
                        ),
                      ],
                    ),
                    gapH20,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextWidget(
                          text: t.landing.variable_cost,
                          fontSize: Sizes.p16,
                        ),
                        TextWidget(
                          text: "€$totalVariable",
                          fontSize: Sizes.p16,
                        ),
                      ],
                    ),
                    gapH20,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextWidget(
                          text: t.profitMargin,
                          fontSize: Sizes.p16,
                        ),
                        TextWidget(
                          text: "${(profitMargin * 100).round()}%",
                          fontSize: Sizes.p16,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
