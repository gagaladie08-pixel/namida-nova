import 'package:youtipie/class/youtipie_feed/yt_feed_base.dart';

class StreamInfoItemShort extends YoutubeFeed {
  @override
  final String id;
  @override
  final dynamic title;
  final dynamic viewsText;
  final dynamic viewsCount;
  final List<dynamic> liveThumbs;

  const StreamInfoItemShort({
    this.id = '',
    this.title,
    this.viewsText,
    this.viewsCount,
    this.liveThumbs = const [],
    super.items = const [],
  });

  dynamic noSuchMethod(Invocation invocation) => null;
}
