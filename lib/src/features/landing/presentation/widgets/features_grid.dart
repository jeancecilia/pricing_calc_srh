import 'package:flutter/widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pricing_calculator/gen/assets.gen.dart';
import 'package:pricing_calculator/i18n/strings.g.dart';
import 'package:pricing_calculator/src/features/landing/presentation/widgets/feature_card.dart';
import 'package:pricing_calculator/src/utilities/device_extensions.dart';

class FeatureGrid extends HookConsumerWidget {
  const FeatureGrid({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final t = Translations.of(context);
    return LayoutBuilder(
      builder: (context, constraints) {
        final features = [
          {
            "title": t.landing.features[0].title,
            "description": t.landing.features[0].description,
          },
          {},
          {},
          {
            "title": t.landing.features[1].title,
            "description": t.landing.features[1].description,
          },
          {
            "title": t.landing.features[2].title,
            "description": t.landing.features[2].description,
          },
          {},
        ];

        final featureImages = [
          Assets.gridImage1.path,
          Assets.gridImage2.path,
          Assets.gridImage3.path,
        ];

        final mobileFeatures = [
          {
            "title": t.landing.features[0].title,
            "description": t.landing.features[0].description,
          },
          {
            "title": t.landing.features[1].title,
            "description": t.landing.features[1].description,
          },
          {
            "title": t.landing.features[2].title,
            "description": t.landing.features[2].description,
          },
        ];

        if (context.isTabletOrLess) {
          return ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: mobileFeatures.length,
            itemBuilder: (context, index) {
              return FeatureCard(
                index: index,
                title: mobileFeatures[index]['title']!,
                description: mobileFeatures[index]['description']!,
              );
            },
          );
        } else {
          return GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 1.5,
            ),
            itemCount: features.length,
            itemBuilder: (context, index) {
              return FeatureCard(
                index: index,
                title: index == 1 || index == 2 || index == 5
                    ? null
                    : features[index]['title']!,
                description: index == 1 || index == 2 || index == 5
                    ? null
                    : features[index]['description']!,
                image: index == 1 || index == 2 || index == 5
                    ? index == 1
                        ? featureImages[0]
                        : index == 2
                            ? featureImages[1]
                            : featureImages[2]
                    : null,
              );
            },
          );
        }
      },
    );
  }
}
