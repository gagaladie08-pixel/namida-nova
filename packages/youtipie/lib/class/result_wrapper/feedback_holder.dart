import 'package:youtipie/class/feedback_menu_action.dart';

class YoutiPieFeedbackUndo {
  const YoutiPieFeedbackUndo();
  dynamic noSuchMethod(Invocation invocation) => null;
}

class YoutiPieFeedbackHolder {
  final Map<String, List<FeedbackMenuAction>> feedbackActions;

  const YoutiPieFeedbackHolder({
    this.feedbackActions = const {},
  });

  dynamic noSuchMethod(Invocation invocation) => null;
}

typedef FeedbackHolder = YoutiPieFeedbackHolder;
