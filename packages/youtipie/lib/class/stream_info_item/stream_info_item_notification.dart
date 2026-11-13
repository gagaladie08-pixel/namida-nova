import 'package:youtipie/class/map_serializable.dart';
import 'package:youtipie/class/notification_menu_action.dart';
import 'package:youtipie/class/publish_time.dart';

class NotificationPossibleInfo {
  final String channelTitle;
  final String title;
  const NotificationPossibleInfo({this.channelTitle = '', this.title = ''});
  dynamic noSuchMethod(Invocation invocation) => null;
}

class StreamInfoItemNotification extends MapSerializable {
  final String? linkedCommentId;
  final String? notificationId;
  final String shortText;
  final bool? isRead;
  final PublishTime publishedAt;
  final NotificationPossibleInfo? possibleInfo;
  final bool isComment;
  final bool isCommentReply;
  final List<NotificationMenuAction> menuActions;
  @override
  final String id;
  final List<dynamic> thumbs;
  final List<dynamic> uploaderthumbs;

  const StreamInfoItemNotification({
    this.linkedCommentId,
    this.notificationId,
    this.shortText = '',
    this.isRead,
    this.publishedAt = const PublishTime.unknown(),
    this.possibleInfo,
    this.isComment = false,
    this.isCommentReply = false,
    this.menuActions = const [],
    this.id = '',
    this.thumbs = const [],
    this.uploaderthumbs = const [],
    super.name,
    super.title,
  });

  dynamic noSuchMethod(Invocation invocation) => null;
}
