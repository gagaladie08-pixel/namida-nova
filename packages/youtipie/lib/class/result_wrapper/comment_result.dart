import 'package:youtipie/class/comments/comment_info_item.dart';
import 'package:youtipie/class/result_wrapper/list_wrapper_base.dart';

class YoutiPieCommentResult extends YoutiPieListWrapper<CommentInfoItem> {
  @override
  final List<CommentInfoItem> items;
  final CommentInfoItem? linkedReply;
  final String? linkedMainCommentId;

  const YoutiPieCommentResult({
    this.items = const [],
    this.linkedReply,
    this.linkedMainCommentId,
  });

  dynamic noSuchMethod(Invocation invocation) => null;
}

typedef CommentResult = YoutiPieCommentResult;
