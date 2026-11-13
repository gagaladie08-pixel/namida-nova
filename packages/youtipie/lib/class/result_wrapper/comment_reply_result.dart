import 'package:youtipie/class/comments/comment_info_item.dart';
import 'package:youtipie/class/result_wrapper/list_wrapper_base.dart';

class YoutiPieCommentReplyResult extends YoutiPieListWrapper<CommentInfoItem> {
  final String commentId;
  final String? cacheKey;
  final int repliesCount;
  final dynamic continuation;
  @override
  final List<CommentInfoItem> items;

  const YoutiPieCommentReplyResult({
    this.commentId = '',
    this.cacheKey,
    this.repliesCount = 0,
    this.continuation,
    this.items = const [],
  });

  dynamic noSuchMethod(Invocation invocation) => null;
}

typedef CommentReplyResult = YoutiPieCommentReplyResult;
