import 'package:youtipie/class/comments/comment_info_item_base.dart';
import 'package:youtipie/class/publish_time.dart';
import 'package:youtipie/core/enum.dart';

class CommentAuthor {
  final bool isArtist;
  final String? memberBadgeText;

  const CommentAuthor({
    this.isArtist = false,
    this.memberBadgeText,
  });

  dynamic noSuchMethod(Invocation invocation) => null;
}

class CommentContent {
  final String? rawText;

  const CommentContent({
    this.rawText,
  });

  dynamic noSuchMethod(Invocation invocation) => null;
}

class CommentInfoItem extends CommentInfoItemBase {
  final int repliesCount;
  final dynamic replyContinuation;
  final PublishTime publishedAt;
  final String? publishedTimeText;
  final CommentContent content;
  final String? voiceReplyTranscript;
  final int? likesCount;
  final bool isHearted;
  final bool isPinned;
  final CommentAuthor? author;
  final bool isEdited;
  final LikeStatus likeStatus;

  const CommentInfoItem({
    super.commentId = '',
    this.repliesCount = 0,
    this.replyContinuation,
    this.publishedAt = const PublishTime.unknown(),
    this.publishedTimeText,
    this.content = const CommentContent(),
    this.voiceReplyTranscript,
    this.likesCount,
    this.isHearted = false,
    this.isPinned = false,
    this.author,
    this.isEdited = false,
    this.likeStatus = LikeStatus.unknown,
  });

  dynamic noSuchMethod(Invocation invocation) => null;
}
