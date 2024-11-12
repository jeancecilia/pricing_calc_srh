import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pricing_calculator/i18n/strings.g.dart';
import 'package:pricing_calculator/src/constants/app_sizes.dart';
import 'package:pricing_calculator/src/constants/assets.dart';
import 'package:pricing_calculator/src/constants/colors.dart';
import 'package:pricing_calculator/src/shared/container_widget.dart';
import 'package:pricing_calculator/src/shared/text_widget.dart';
import 'package:pricing_calculator/src/utilities/navigator_utils.dart';

class TestimonialSection extends HookConsumerWidget {
  const TestimonialSection({
    super.key,
    required this.index,
  });

  final int index;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = usePageController();

    final t = Translations.of(context);

    return ContainerWidget(
      key: NavigationUtilities.keys[index],
      child: Column(
        children: [
          gapH100,
          gapH100,
          ContainerWidget(
            borderRadius: BorderRadius.circular(30),
            padding: const EdgeInsets.symmetric(
                horizontal: Sizes.p20, vertical: Sizes.p4),
            color: AppColors.whitishGray,
            child: TextWidget(
              fontSize: Sizes.p14,
              text: t.landing.testimonials,
            ),
          ),
          gapH20,
          TextWidget(
            text: t.landing.testimonial_title,
            fontSize: Sizes.p32,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * .85,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    controller.previousPage(
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.easeIn);
                  },
                  child: Image.asset(
                    AppAssets.arrowRight,
                    width: Sizes.p50,
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * .65,
                  height: 150,
                  child: PageView(
                      controller: controller,
                      children: List.generate(10, (index) {
                        return const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            TextWidget(
                              textAlign: TextAlign.center,
                              text:
                                  "Lorem ipsum dolor sit amet consectetur. Vel cursus neque lorem quam tortor cursus mauris metus. Vel aliquam odio diam arcu orci risus eget sagittis.",
                              color: Color(0xff4A4A59),
                              fontWeight: FontWeight.w500,
                              fontSize: Sizes.p20,
                            ),
                            TextWidget(
                              text:
                                  "– Sarah Mitchell, CEO, Tech Innovators Inc.",
                              fontSize: Sizes.p14,
                            )
                          ],
                        );
                      })),
                ),
                InkWell(
                  onTap: () {
                    controller.nextPage(
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.easeIn);
                  },
                  child: Image.asset(
                    AppAssets.arrowLeft,
                    width: Sizes.p50,
                  ),
                ),
              ],
            ),
          ),
          gapH100,
          gapH100,
        ],
      ),
    );
  }
}
