import 'package:youtipie/class/map_serializable.dart';
import 'package:youtipie/class/publish_time.dart';

class NotificationPossibleInfo {
  final String? channelTitle;
  const NotificationPossibleInfo({this.channelTitle});
  dynamic noSuchMethod(Invocation invocation) => null;
}

class StreamInfoItemNotification extends MapSerializable {
  final String? linkedCommentId;
  final String? notificationId;
  final String? shortText;
  final bool? isRead;
  final PublishTime publishedAt;
  final NotificationPossibleInfo possibleInfo;
  final bool isComment;
  final bool isCommentReply;
  @override
  final String id;
  final List<dynamic> thumbs;
  final List<dynamic> uploaderthumbs;

  const StreamInfoItemNotification({
    this.linkedCommentId,
    this.notificationId,
    this.shortText,
    this.isRead,
    this.publishedAt = const PublishTime.unknown(),
    this.possibleInfo = const NotificationPossibleInfo(),
    this.isComment = false,
    this.isCommentReply = false,
    this.id = '',
    this.thumbs = const [],
    this.uploaderthumbs = const [],
    super.name,
    super.title,
  });

  dynamic noSuchMethod(Invocation invocation) => null;
}
