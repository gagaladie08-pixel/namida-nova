import 'package:youtipie/class/youtipie_feed/yt_feed_base.dart';

class StreamInfoItemShort extends YoutubeFeed {
  @override
  final String id;

  const StreamInfoItemShort({
    this.id = '',
    super.items = const [],
  });

  dynamic noSuchMethod(Invocation invocation) => null;
}
