import 'package:youtipie/class/channels/channel_info.dart';
import 'package:youtipie/class/result_wrapper/list_wrapper_base.dart';

class YoutiPieUserChannelsResult extends YoutiPieListWrapper<YoutiPieChannelInfo> {
  @override
  final List<YoutiPieChannelInfo> items;

  const YoutiPieUserChannelsResult({this.items = const []});

  dynamic noSuchMethod(Invocation invocation) => null;
}

typedef ChannelUserResult = YoutiPieUserChannelsResult;
