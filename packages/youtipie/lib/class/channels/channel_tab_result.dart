import 'package:youtipie/class/items_sort.dart';
import 'package:youtipie/class/youtipie_feed/yt_feed_base.dart';
import 'package:youtipie/class/result_wrapper/list_wrapper_base.dart';

class YoutiPieChannelTabResult extends YoutiPieListWrapper<YoutubeFeed> with YoutiPieListSorterMixin<YoutubeFeed> {
  @override
  final List<YoutubeFeed> items;
  final String? channelId;

  const YoutiPieChannelTabResult({this.items = const [], this.channelId});

  dynamic noSuchMethod(Invocation invocation) => null;
}

typedef ChannelTabResult = YoutiPieChannelTabResult;
