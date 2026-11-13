import 'package:youtipie/class/youtipie_feed/yt_feed_base.dart';

class StreamInfoItem extends YoutubeFeed {
  @override
  final String id;
  final String? channelId;
  final dynamic channel;

  const StreamInfoItem({
    this.id = '',
    this.channelId,
    this.channel,
    super.items = const [],
  });

  dynamic noSuchMethod(Invocation invocation) => null;
}
