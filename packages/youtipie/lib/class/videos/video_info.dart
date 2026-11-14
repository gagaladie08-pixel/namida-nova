import 'package:youtipie/class/publish_time.dart';

class VideoInfo {
  final dynamic id;
  final dynamic name;
  final String? title;
  final dynamic engagement;
  final PublishTime publishedAt;
  final int? viewsCount;
  final String? viewCountTextShort;
  final String? viewCountTextLong;
  final String? description;

  const VideoInfo({
    this.id,
    this.name,
    this.title,
    this.engagement,
    this.publishedAt = const PublishTime.unknown(),
    this.viewsCount,
    this.viewCountTextShort,
    this.viewCountTextLong,
    this.description,
  });

  dynamic noSuchMethod(Invocation invocation) => null;
}

typedef YoutiPieVideoInfo = VideoInfo;
