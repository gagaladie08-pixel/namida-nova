import 'package:youtipie/class/comments/comment_info_item_base.dart';
import 'package:youtipie/class/publish_time.dart';
import 'package:youtipie/class/youtipie_description/youtipie_description.dart';
import 'package:youtipie/core/enum.dart';

export 'package:youtipie/class/comments/comment_info_item_base.dart';

class CommentInfoItem extends CommentInfoItemBase {
  final int? repliesCount;
  final dynamic replyContinuation;
  final bool isPinned;

  const CommentInfoItem({
    super.commentId = '',
    super.authorAvatarUrl,
    super.author,
    super.publishedAt = const PublishTime.unknown(),
    super.publishedTimeText,
    super.content = const YoutipieDescription(),
    super.voiceReplyTranscript,
    super.isHearted = false,
    super.isEdited = false,
    super.likesCount,
    super.likeStatus = LikeStatus.unknown,
    super.engagement = const CommentEngagement(),
    this.repliesCount = 0,
    this.replyContinuation,
    this.isPinned = false,
  });

  dynamic noSuchMethod(Invocation invocation) => null;
}
