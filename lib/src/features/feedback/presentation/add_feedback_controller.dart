import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pricing_calculator/src/features/feedback/data/feedback_repo.dart';
import 'package:pricing_calculator/src/features/feedback/domain/feedback_model.dart';

class AddFeedbackController extends StateNotifier<AsyncValue<void>> {
  AddFeedbackController(this.ref) : super(const AsyncData(null));
  final Ref ref;

  Future<void> sendFeedback(FeedbackModel feedback) async {
    try {
      state = const AsyncLoading();

      await ref.read(feedbackRepoProvider).sendFeedback(feedback);

      state = const AsyncData(null);
    } catch (e) {
      state = AsyncError(e, StackTrace.current);
    }
  }
}

final feedbackControllerProvider =
    StateNotifierProvider<AddFeedbackController, AsyncValue<void>>((ref) {
  return AddFeedbackController(ref);
});
