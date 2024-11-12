import 'package:flutter/material.dart';
import 'package:pricing_calculator/i18n/strings.g.dart';
import 'package:pricing_calculator/src/router/routes.dart';

List<Map<String, dynamic>> navOptions = [
  {
    "icon": "assets/images/dashboard_icon.png",
    "label": "Home",
    "route": Routes.home
  },
];

class AppNavigationItemModel {
  final String label;
  final String route;

  AppNavigationItemModel({required this.label, required this.route});
}

List<AppNavigationItemModel> getNavigationItems(BuildContext context) {
  final t = Translations.of(context);
  return [
    AppNavigationItemModel(
      route: Routes.home,
      label: t.landing.navigation.home,
    ),
    AppNavigationItemModel(
      route: Routes.features,
      label: t.landing.navigation.features,
    ),
    AppNavigationItemModel(
      route: Routes.pricingCalculator,
      label: t.landing.navigation.pricing_calculator,
    ),
    AppNavigationItemModel(
      route: Routes.benefits,
      label: t.landing.navigation.benefits,
    ),
    AppNavigationItemModel(
      route: Routes.contact,
      label: t.landing.navigation.contact_us,
    ),
  ];
}
