import 'package:youtipie/class/youtipie_feed/playlist_basic_info.dart';

class YoutiPiePlaylistResultBase {
  final dynamic id;
  final dynamic name;
  final dynamic title;
  final PlaylistBasicInfo? basicInfo;
  final List<dynamic> items;

  const YoutiPiePlaylistResultBase({
    this.id,
    this.name,
    this.title,
    this.basicInfo,
    this.items = const [],
  });

  dynamic noSuchMethod(Invocation invocation) => null;
}

typedef PlaylistResultBase = YoutiPiePlaylistResultBase;
