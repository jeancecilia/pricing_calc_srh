class FeedbackModel {
  final String timeSaved;
  final String ease;
  final String accuracy;
  final String satisfaction;

  FeedbackModel({
    required this.timeSaved,
    required this.ease,
    required this.accuracy,
    required this.satisfaction,
  });

  Map<String, dynamic> toMap() {
    return {
      'timeSaved': timeSaved,
      'ease': ease,
      'accuracy': accuracy,
      'satisfaction': satisfaction,
    };
  }

  FeedbackModel copyWith({
    String? timeSaved,
    String? ease,
    String? accuracy,
    String? satisfaction,
  }) {
    return FeedbackModel(
      timeSaved: timeSaved ?? this.timeSaved,
      ease: ease ?? this.ease,
      accuracy: accuracy ?? this.accuracy,
      satisfaction: satisfaction ?? this.satisfaction,
    );
  }
}
