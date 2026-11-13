import 'package:youtipie/class/result_wrapper/comment_result.dart';

class YoutiPieNotificationCommentResult extends YoutiPieCommentResult {
  const YoutiPieNotificationCommentResult({
    super.items = const [],
    super.linkedReply,
    super.linkedMainCommentId,
  });

  dynamic noSuchMethod(Invocation invocation) => null;
}

typedef CommentNotificationResult = YoutiPieNotificationCommentResult;
