import 'package:youtipie/core/enum.dart';

class FeedbackMenuAction {
  final FeedbackMenuActionType type;
  final String text;
  final String? undoToken;

  const FeedbackMenuAction({
    this.type = FeedbackMenuActionType.notInterested,
    this.text = '',
    this.undoToken,
  });

  dynamic noSuchMethod(Invocation invocation) => null;
}
