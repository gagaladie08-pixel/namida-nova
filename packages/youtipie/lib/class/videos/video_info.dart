import 'package:youtipie/class/publish_time.dart';
import 'package:youtipie/class/youtipie_description/youtipie_description.dart';

class VideoInfo {
  final dynamic id;
  final dynamic name;
  final String? title;
  final dynamic engagement;
  final PublishTime publishedAt;
  final int? viewsCount;
  final String? viewCountTextShort;
  final String? viewCountTextLong;
  final YoutipieDescription? description;

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

  String buildUrl() => '';

  dynamic noSuchMethod(Invocation invocation) => null;
}

typedef YoutiPieVideoInfo = VideoInfo;
