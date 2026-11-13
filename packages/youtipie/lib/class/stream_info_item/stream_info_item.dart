import 'package:youtipie/class/youtipie_feed/yt_feed_base.dart';

class StreamInfoItem extends YoutubeFeed {
  @override
  final String id;
  final String? channelId;
  final dynamic channel;
  final int? durSeconds;
  final List<dynamic> liveThumbs;
  final List<dynamic> thumbnails;

  const StreamInfoItem({
    this.id = '',
    this.channelId,
    this.channel,
    this.durSeconds,
    this.liveThumbs = const [],
    this.thumbnails = const [],
    super.items = const [],
  });

  dynamic noSuchMethod(Invocation invocation) => null;
}
