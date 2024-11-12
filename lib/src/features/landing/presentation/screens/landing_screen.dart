import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pricing_calculator/i18n/strings.g.dart';
import 'package:pricing_calculator/src/constants/app_sizes.dart';
import 'package:pricing_calculator/src/constants/assets.dart';
import 'package:pricing_calculator/src/constants/colors.dart';
import 'package:pricing_calculator/src/constants/nav_constants.dart';
import 'package:pricing_calculator/src/features/calculator/presentation/price_calculator.dart';
import 'package:pricing_calculator/src/features/landing/presentation/widgets/benefits_section.dart';
import 'package:pricing_calculator/src/features/landing/presentation/widgets/call_to_action_button.dart';
import 'package:pricing_calculator/src/features/landing/presentation/widgets/contact_section.dart';
import 'package:pricing_calculator/src/features/landing/presentation/widgets/features_section.dart';
import 'package:pricing_calculator/src/features/landing/presentation/widgets/hero_section.dart';
import 'package:pricing_calculator/src/features/landing/presentation/widgets/navigation_bar.dart';
import 'package:pricing_calculator/src/router/routes.dart';
import 'package:pricing_calculator/src/shared/text_widget.dart';
import 'package:pricing_calculator/src/utilities/device_extensions.dart';
import 'package:pricing_calculator/src/utilities/navigator_utils.dart';
import 'package:visibility_detector/visibility_detector.dart';

class LandingScreen extends HookConsumerWidget {
  const LandingScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<AppNavigationItemModel> navigationItems =
        getNavigationItems(context);

    final scrollController = useScrollController();
    final currentIndex = useState(0);
    final t = Translations.of(context);
    return Scaffold(
      backgroundColor: Colors.white,
      key: NavigationUtilities.key,
      drawer: Drawer(
        backgroundColor: AppColors.white,
        shape: const RoundedRectangleBorder(),
        child: ListView(
          padding: const EdgeInsets.all(Sizes.p20),
          children: [
            ListTile(
              title: TextWidget(
                text: t.landing.navigation.calculate,
                fontWeight: FontWeight.bold,
              ),
              onTap: () {
                NavigationUtilities.updateUrlWithoutNavigation(
                    Routes.pricingCalculator);
                Navigator.of(context).pop();
                Scrollable.ensureVisible(
                    NavigationUtilities.pricingCalculatorKey.currentContext!,
                    duration: const Duration(seconds: 1));
              },
            ),
            ...List.generate(
              navigationItems.length,
              (index) {
                return ListTile(
                  title: TextWidget(
                    text: navigationItems[index].label,
                    fontWeight: FontWeight.bold,
                  ),
                  onTap: () {
                    NavigationUtilities.updateUrlWithoutNavigation(
                        navigationItems[index].route);
                    Navigator.of(context).pop();
                    Scrollable.ensureVisible(
                        NavigationUtilities.keys[index].currentContext!,
                        duration: const Duration(seconds: 1));
                  },
                );
              },
            ),
          ],
        ),
      ),
      body: SelectionArea(
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: NavigationBarWidget(
                destinations: [
                  InkWell(
                    onTap: () {
                      NavigationUtilities.updateUrlWithoutNavigation(
                          Routes.home);
                      Scrollable.ensureVisible(
                          NavigationUtilities.heroKey.currentContext!,
                          duration: const Duration(seconds: 1));
                    },
                    child: Image.asset(
                      AppAssets.homeIcon,
                      width: context.isTabletOrLess ? 100 : 200,
                    ),
                  ),
                  Visibility(
                    visible: context.isDesktop,
                    child: SizedBox(
                      width: 700,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: List.generate(
                          navigationItems.length,
                          (index) {
                            return TextWidget(
                              onTap: () {
                                Scrollable.ensureVisible(
                                    NavigationUtilities
                                        .keys[index].currentContext!,
                                    duration: const Duration(seconds: 1));
                                Future.delayed(const Duration(seconds: 2), () {
                                  NavigationUtilities
                                      .updateUrlWithoutNavigation(
                                          navigationItems[index].route);
                                });

                                currentIndex.value = index;
                              },
                              color: currentIndex.value == index
                                  ? AppColors.selectedNavItem
                                  : AppColors.textSecondary,
                              text: navigationItems[index].label,
                              fontWeight: currentIndex.value == index
                                  ? FontWeight.bold
                                  : FontWeight.w500,
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                  Visibility(
                    visible: context.isDesktop,
                    child: CallToActionButton(
                      label: TextWidget(
                        text: t.landing.navigation.calculate,
                        color: AppColors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                      fixedSize: const Size(200, 50),
                      padding: const EdgeInsets.symmetric(
                        horizontal: Sizes.p40,
                      ),
                      onTap: () {
                        NavigationUtilities.updateUrlWithoutNavigation(
                            Routes.pricingCalculator);
                        Scrollable.ensureVisible(
                            NavigationUtilities
                                .pricingCalculatorKey.currentContext!,
                            duration: const Duration(seconds: 1));
                      },
                    ),
                  ),
                  Visibility(
                    visible: !context.isDesktop,
                    child: Builder(
                      builder: (context) {
                        return IconButton(
                          icon: const Icon(Icons.menu),
                          onPressed: () {
                            Scaffold.of(context).openDrawer();
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 9,
              child: SingleChildScrollView(
                controller: scrollController,
                child: Column(
                  children: [
                    ...List.generate(NavigationUtilities.keys.length, (index) {
                      return VisibilityDetector(
                        key: Key('section-$index'),
                        onVisibilityChanged: (visibilityInfo) {
                          if (visibilityInfo.visibleFraction > 0.8) {
                            currentIndex.value = index;
                            final route =
                                index == 0 ? '/' : navigationItems[index].route;
                            Future.delayed(const Duration(seconds: 1), () {
                              NavigationUtilities.updateUrlWithoutNavigation(
                                  route);
                            });
                          }
                        },
                        child: index == 0
                            ? HeroSectionWidget(
                                index: index,
                                onTap: () {
                                  NavigationUtilities
                                      .updateUrlWithoutNavigation(
                                          Routes.pricingCalculator);
                                  Scrollable.ensureVisible(
                                      NavigationUtilities
                                          .pricingCalculatorKey.currentContext!,
                                      duration: const Duration(seconds: 1));
                                },
                              )
                            : index == 1
                                ? FeaturesSection(index: index)
                                : index == 2
                                    ? PricingCalculatorWidget(
                                        index: index,
                                      )
                                    : index == 3
                                        ? BenefitsSection(
                                            index: index,
                                          )
                                        : ContactUsSection(
                                            index: index,
                                          ),
                      );
                    }),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
