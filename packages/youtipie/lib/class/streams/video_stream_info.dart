import 'package:youtipie/class/publish_time.dart';
import 'package:youtipie/class/stream_info_item/stream_info_item.dart';

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
  final String? description;
  final List<String> keywords;
  final dynamic uploadDate;

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
    this.description,
    this.keywords = const [],
    this.uploadDate,
  });

  PublishTime get publishDate => publishedAt;
  String? get availableDescription => description;
  bool get isLiveNow => false;

  static VideoStreamInfo merge(String videoId, VideoStreamInfo? cached, VideoStreamInfo fresh) => fresh;
  static VideoStreamInfo fromMap(dynamic map) => const VideoStreamInfo();
  StreamInfoItem toStreamInfo() => const StreamInfoItem();

  dynamic noSuchMethod(Invocation invocation) => null;
}
