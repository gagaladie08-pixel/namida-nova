import 'package:youtipie/class/stream_info_item/stream_info_item.dart';
import 'package:youtipie/class/youtipie_feed/playlist_basic_info.dart';

class YoutiPiePlaylistResultBase {
  final dynamic id;
  final dynamic name;
  final dynamic title;
  final PlaylistBasicInfo basicInfo;
  final List<StreamInfoItem> items;

  const YoutiPiePlaylistResultBase({
    this.id,
    this.name,
    this.title,
    this.basicInfo = const PlaylistBasicInfo(),
    this.items = const [],
  });

  dynamic noSuchMethod(Invocation invocation) => null;
}

typedef PlaylistResultBase = YoutiPiePlaylistResultBase;
