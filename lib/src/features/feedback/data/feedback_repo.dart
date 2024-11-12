import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pricing_calculator/src/features/feedback/domain/feedback_model.dart';
import 'package:pricing_calculator/src/utilities/custom_exceptions.dart';

abstract class FeedbackRepo {
  Future<void> sendFeedback(FeedbackModel feedbackModel);
}

final feedbackRepoProvider = Provider<FeedbackRepo>((ref) {
  return FeedbackRepoImpl();
});

class FeedbackRepoImpl implements FeedbackRepo {
  final CollectionReference feedbackCollection =
      FirebaseFirestore.instance.collection('feedback');
  @override
  Future<void> sendFeedback(FeedbackModel feedbackModel) async {
    try {
      await feedbackCollection.add(feedbackModel.toMap());
    } catch (e) {
      log(e.toString());
      throw CustomException(
          message: 'An error occurred while sending feedback',
          translations: {
            'en': 'An error occurred while sending feedback',
            'de': 'Beim Senden des Feedbacks ist ein Fehler aufgetreten',
          });
    }
  }
}
