import 'package:youtipie/class/youtipie_feed/yt_feed_base.dart';
import 'package:youtipie/class/result_wrapper/list_wrapper_base.dart';

class YoutiPieFeedResult extends YoutiPieListWrapper<YoutubeFeed> {
  @override
  final List<YoutubeFeed> items;
  final dynamic shortsSection;

  const YoutiPieFeedResult({
    this.items = const [],
    this.shortsSection,
  });

  dynamic noSuchMethod(Invocation invocation) => null;
}

typedef FeedResult = YoutiPieFeedResult;
