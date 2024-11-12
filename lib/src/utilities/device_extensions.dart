import 'package:flutter/material.dart';

extension BuildContextExtension on BuildContext {
  double get width => MediaQuery.of(this).size.width;
  double get height => MediaQuery.of(this).size.height;

  bool get isMobile => width < 768;
  bool get isTablet => width >= 768 && width < 1024;
  bool get isDesktop => width >= 1024;

  bool get isTabletOrMore => width >= 1024;
  bool get isMobileOrMore => width >= 768;
  bool get isTabletOrLess => width <= 1024;
  bool get isMobileOrLess => width <= 768;
}
