import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pricing_calculator/i18n/strings.g.dart';
import 'package:pricing_calculator/src/constants/app_sizes.dart';
import 'package:pricing_calculator/src/constants/colors.dart';
import 'package:pricing_calculator/src/shared/container_widget.dart';
import 'package:pricing_calculator/src/shared/text_widget.dart';
import 'package:pricing_calculator/src/utilities/navigator_utils.dart';

class FaqSection extends HookConsumerWidget {
  const FaqSection({
    super.key,
    required this.index,
  });
  final int index;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final t = Translations.of(context);
    return ContainerWidget(
        key: NavigationUtilities.keys[index],
        padding: const EdgeInsets.symmetric(horizontal: Sizes.p73),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            gapH40,
            Row(
              children: [
                TextWidget(
                  text: t.landing.faq_title,
                  fontSize: Sizes.p40,
                ),
              ],
            ),
            gapH40,
            ...List.generate(3, (index) {
              return ContainerWidget(
                margin: const EdgeInsets.symmetric(vertical: Sizes.p20),
                padding: const EdgeInsets.all(Sizes.p20),
                borderRadius: BorderRadius.circular(10),
                border: Border.all(width: 1, color: AppColors.lightGrey),
                child: ExpansionTile(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    collapsedIconColor: AppColors.black,
                    title: const TextWidget(
                      text: "Lorem ipsum dolor sit amet consectetur.",
                      color: AppColors.black,
                      fontSize: Sizes.p20,
                      fontWeight: FontWeight.w600,
                    ),
                    children: const [
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: Sizes.p20),
                        child: Row(
                          children: [
                            TextWidget(
                                fontSize: Sizes.p18,
                                textAlign: TextAlign.center,
                                text:
                                    "Lorem ipsum dolor sit amet consectetur. Vitae neque duis purus egestas odio felis iaculis malesuada."),
                          ],
                        ),
                      )
                    ]),
              );
            })
          ],
        ));
  }
}
