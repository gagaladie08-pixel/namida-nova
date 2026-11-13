import 'package:youtipie/class/publish_time.dart';

class VideoStreamInfo {
  final dynamic id;
  final String? name;
  final String? title;
  final String? channelId;
  final String? channelName;
  final int? durSeconds;
  final PublishTime publishedAt;
  final int? viewsCount;
  final dynamic channel;
  final List<dynamic> thumbnails;

  const VideoStreamInfo({
    this.id,
    this.name,
    this.title,
    this.channelId,
    this.channelName,
    this.durSeconds,
    this.publishedAt = const PublishTime.unknown(),
    this.viewsCount,
    this.channel,
    this.thumbnails = const [],
  });

  dynamic noSuchMethod(Invocation invocation) => null;
}
