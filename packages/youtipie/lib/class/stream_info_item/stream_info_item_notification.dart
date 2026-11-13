import 'package:youtipie/class/map_serializable.dart';

class StreamInfoItemNotification extends MapSerializable {
  final String? linkedCommentId;
  final String? notificationId;
  @override
  final String id;
  final List<dynamic> thumbs;
  final List<dynamic> uploaderthumbs;

  const StreamInfoItemNotification({
    this.linkedCommentId,
    this.notificationId,
    this.id = '',
    this.thumbs = const [],
    this.uploaderthumbs = const [],
    super.name,
    super.title,
  });

  dynamic noSuchMethod(Invocation invocation) => null;
}
