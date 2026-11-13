import 'package:youtipie/class/youtipie_feed/yt_feed_base.dart';
import 'package:youtipie/class/result_wrapper/list_wrapper_base.dart';

class YoutiPieHashtagResult extends YoutiPieListWrapper<YoutubeFeed> {
  @override
  final List<YoutubeFeed> items;

  const YoutiPieHashtagResult({this.items = const []});

  dynamic noSuchMethod(Invocation invocation) => null;
}

typedef HashtagResult = YoutiPieHashtagResult;
