import 'package:youtipie/class/youtipie_feed/yt_feed_base.dart';
import 'package:youtipie/class/result_wrapper/list_wrapper_base.dart';

class YoutiPieChannelTabResult extends YoutiPieListWrapper<YoutubeFeed> {
  @override
  final List<YoutubeFeed> items;

  const YoutiPieChannelTabResult({this.items = const []});

  dynamic noSuchMethod(Invocation invocation) => null;
}

typedef ChannelTabResult = YoutiPieChannelTabResult;
