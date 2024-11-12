import 'dart:developer';

import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AnalyticsManager {
  FirebaseAnalytics analytics = FirebaseAnalytics.instance;

  Future<void> logEvent(String name, Map<String, Object> parameters) async{
    try {
       await analytics.logEvent(name: name, parameters: parameters);
      log('Logged event: $name');
    } catch (e) {
      log('Failed to log event: $e');
    }
  }
}

final analyticsManagerProvider = Provider((ref) => AnalyticsManager());
