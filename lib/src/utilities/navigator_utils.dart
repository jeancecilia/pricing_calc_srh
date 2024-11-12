import 'package:flutter/material.dart';
import 'package:universal_html/html.dart' as html;

class NavigationUtilities {
  static final GlobalKey<ScaffoldState> key = GlobalKey();
  static final GlobalKey heroKey = GlobalKey();
  static final GlobalKey featuresKey = GlobalKey();
  static final GlobalKey pricingCalculatorKey = GlobalKey();
  static final GlobalKey benefitsKey = GlobalKey();
  static final GlobalKey contactKey = GlobalKey();

  static void updateUrlWithoutNavigation(String path) {
    html.window.history.pushState(null, '', path);
  }

  static List<GlobalKey> keys = [
    heroKey,
    featuresKey,
    pricingCalculatorKey,
    benefitsKey,
    contactKey
  ];
}
