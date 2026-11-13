import 'package:youtipie/class/comments/comment_info_item_base.dart';

class CommentInfoItem extends CommentInfoItemBase {
  final int repliesCount;

  const CommentInfoItem({
    super.commentId = '',
    this.repliesCount = 0,
  });

  dynamic noSuchMethod(Invocation invocation) => null;
}
