import 'package:youtipie/class/publish_time.dart';
import 'package:youtipie/class/youtipie_description/youtipie_description.dart';
import 'package:youtipie/core/enum.dart';

class CommentAuthor {
  final String? avatarThumbnailUrl;
  final String? displayName;
  final String? channelId;
  final bool isCurrentUser;
  final bool isArtist;
  final String? memberBadgeText;

  const CommentAuthor({
    this.avatarThumbnailUrl,
    this.displayName,
    this.channelId,
    this.isCurrentUser = false,
    this.isArtist = false,
    this.memberBadgeText,
  });

  dynamic noSuchMethod(Invocation invocation) => null;
}

class CommentEngagement {
  final dynamic createReplyParams;
  final int? likesCount;
  final String? likesCountText;
  final LikeStatus likeStatus;

  const CommentEngagement({
    this.createReplyParams,
    this.likesCount,
    this.likesCountText,
    this.likeStatus = LikeStatus.unknown,
  });

  dynamic noSuchMethod(Invocation invocation) => null;
}

class CommentInfoItemBase {
  final String commentId;
  final String? authorAvatarUrl;
  final CommentAuthor? author;
  final PublishTime publishedAt;
  final String? publishedTimeText;
  final YoutipieDescription content;
  final String? voiceReplyTranscript;
  final bool isHearted;
  final bool isEdited;
  final int? likesCount;
  final LikeStatus likeStatus;
  final CommentEngagement engagement;

  const CommentInfoItemBase({
    this.commentId = '',
    this.authorAvatarUrl,
    this.author,
    this.publishedAt = const PublishTime.unknown(),
    this.publishedTimeText,
    this.content = const YoutipieDescription(),
    this.voiceReplyTranscript,
    this.isHearted = false,
    this.isEdited = false,
    this.likesCount,
    this.likeStatus = LikeStatus.unknown,
    this.engagement = const CommentEngagement(),
  });

  dynamic noSuchMethod(Invocation invocation) => null;
}
