import 'package:flutter/material.dart';
import 'package:flutter_fadein/flutter_fadein.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pricing_calculator/gen/assets.gen.dart';
import 'package:pricing_calculator/i18n/strings.g.dart';
import 'package:pricing_calculator/src/constants/app_sizes.dart';
import 'package:pricing_calculator/src/constants/colors.dart';
import 'package:pricing_calculator/src/features/landing/presentation/widgets/call_to_action_button.dart';
import 'package:pricing_calculator/src/shared/container_widget.dart';
import 'package:pricing_calculator/src/shared/text_widget.dart';
import 'package:pricing_calculator/src/utilities/device_extensions.dart';
import 'package:pricing_calculator/src/utilities/navigator_utils.dart';

class HeroSectionWidget extends HookConsumerWidget {
  const HeroSectionWidget({
    super.key,
    required this.index,
    required this.onTap,
  });
  final int index;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final t = Translations.of(context);
    return ContainerWidget(
      padding: EdgeInsets.symmetric(
        horizontal: context.isDesktop ? 0 : Sizes.p20,
      ),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: Assets.heroSection.provider(),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(
            Colors.black.withOpacity(0.5),
            BlendMode.darken,
          ),
        ),
      ),
      height: 650,
      width: double.infinity,
      key: NavigationUtilities.keys[index],
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: context.isTabletOrLess ? context.height : 890,
              child: FadeIn(
                duration: const Duration(milliseconds: 1000),
                curve: Curves.easeIn,
                child: TextWidget(
                  textAlign: TextAlign.center,
                  text: t.landing.hero_title,
                  fontSize: context.isTabletOrLess ? Sizes.p24 : Sizes.p48,
                  color: AppColors.white,
                ),
              ),
            ),
            gapH20,
            TextWidget(
                text: t.landing.hero_subtitle,
                textAlign: TextAlign.center,
                fontSize: context.isTabletOrLess ? Sizes.p14 : Sizes.p20,
                color: AppColors.white),
            gapH20,
            CallToActionButton(
              label: TextWidget(
                text: t.landing.try_demo,
                color: AppColors.white,
              ),
              onTap: onTap,
            )
          ],
        ),
      ),
    );
  }
}
