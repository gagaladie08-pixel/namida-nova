import 'package:youtipie/class/youtipie_feed/yt_feed_base.dart';
import 'package:youtipie/youtipie.dart';

class PlaylistBasicInfo extends YoutubeFeed {
  @override
  final dynamic id;
  @override
  final dynamic name;
  @override
  final dynamic title;
  final int? videosCount;
  final String? videosCountText;
  final List<Thumbnail> thumbnails;

  const PlaylistBasicInfo({
    this.id,
    this.name,
    this.title,
    this.videosCount,
    this.videosCountText,
    this.thumbnails = const [],
  });

  dynamic noSuchMethod(Invocation invocation) => null;
}
