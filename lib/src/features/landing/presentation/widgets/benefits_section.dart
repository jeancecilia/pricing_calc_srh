import 'package:flutter/widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pricing_calculator/i18n/strings.g.dart';
import 'package:pricing_calculator/src/constants/app_sizes.dart';
import 'package:pricing_calculator/src/constants/assets.dart';
import 'package:pricing_calculator/src/constants/colors.dart';
import 'package:pricing_calculator/src/shared/container_widget.dart';
import 'package:pricing_calculator/src/shared/text_widget.dart';
import 'package:pricing_calculator/src/utilities/device_extensions.dart';
import 'package:pricing_calculator/src/utilities/navigator_utils.dart';

class BenefitsSection extends HookConsumerWidget {
  const BenefitsSection({
    super.key,
    required this.index,
  });
  final int index;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final t = Translations.of(context);

    final benefits = [
      {
        'icon': AppAssets.chip,
        "title": t.landing.benefits[0].title,
        "content": t.landing.benefits[0].content,
      },
      {
        'icon': AppAssets.library,
        "title": t.landing.benefits[1].title,
        "content": t.landing.benefits[1].content,
      },
      {
        'icon': AppAssets.cart,
        "title": t.landing.benefits[2].title,
        "content": t.landing.benefits[2].content,
      },
      {
        'icon': AppAssets.medicalSheild,
        "title": t.landing.benefits[3].title,
        "content": t.landing.benefits[3].content,
      },
    ];
    return ContainerWidget(
      width: double.infinity,
      key: NavigationUtilities.keys[index],
      padding: EdgeInsets.symmetric(
        vertical: context.isTabletOrLess ? Sizes.p14 : Sizes.p38,
      ),
      borderRadius: BorderRadius.circular(10),
      margin: EdgeInsets.symmetric(
        horizontal: context.isTabletOrLess ? Sizes.p14 : Sizes.p38,
      ), // color: AppColors.whitishGray,
      child: Column(
        children: [
          TextWidget(
            text: t.landing.benefits_title,
            fontSize: context.isTabletOrLess ? Sizes.p20 : Sizes.p32,
          ),
          SizedBox(
            width: 850,
            child: TextWidget(
              textAlign: TextAlign.center,
              text: t.landing.benefits_subtitle,
              color: AppColors.blueGrey,
              fontSize: context.isTabletOrLess ? Sizes.p14 : Sizes.p18,
            ),
          ),
          gapH32,
          Container(
            color: AppColors.blueGrey,
            margin: const EdgeInsets.symmetric(horizontal: Sizes.p18),
            child: GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: context.isTabletOrLess ? 1 : 2,
                childAspectRatio: context.isTabletOrLess ? 1.5 : 1.9,
              ),
              itemCount: benefits.length,
              itemBuilder: (context, index) {
                return ContainerWidget(
                    border: Border(
                        right: index == 0 || index == 2
                            ? const BorderSide(
                                color: AppColors.black, width: 0.2)
                            : BorderSide.none,
                        left: index == 1 || index == 3
                            ? const BorderSide(
                                color: AppColors.black, width: 0.2)
                            : BorderSide.none,
                        bottom: index == 0 || index == 1
                            ? const BorderSide(
                                color: AppColors.black, width: 0.2)
                            : BorderSide.none,
                        top: BorderSide.none),
                    borderRadius: BorderRadius.only(
                      bottomRight: index == 0
                          ? const Radius.circular(10)
                          : const Radius.circular(0),
                      bottomLeft: index == 1
                          ? const Radius.circular(10)
                          : const Radius.circular(0),
                      topRight: index == 2
                          ? const Radius.circular(10)
                          : const Radius.circular(0),
                      topLeft: index == 3
                          ? const Radius.circular(10)
                          : const Radius.circular(0),
                    ),
                    color: AppColors.lightGrey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          benefits[index]["icon"],
                          width: context.isTabletOrLess ? Sizes.p24 : Sizes.p32,
                        ),
                        gapH40,
                        TextWidget(
                          textAlign: TextAlign.center,
                          text: benefits[index]["title"],
                          fontWeight: FontWeight.w600,
                          fontSize:
                              context.isTabletOrLess ? Sizes.p14 : Sizes.p24,
                        ),
                        gapH12,
                        SizedBox(
                          width: 600,
                          child: TextWidget(
                            textAlign: TextAlign.center,
                            text: benefits[index]["content"],
                            fontSize:
                                context.isTabletOrLess ? Sizes.p14 : Sizes.p24,
                          ),
                        )
                      ],
                    ));
              },
            ),
          )
        ],
      ),
    );
  }
}
