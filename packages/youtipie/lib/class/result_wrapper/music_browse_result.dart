import 'package:youtipie/class/result_wrapper/list_wrapper_base.dart';

class YoutiPieMusicBrowseResult extends YoutiPieListWrapper<dynamic> {
  @override
  final List<dynamic> items;
  final String? title;
  final String? subtitle;
  final String? channelId;
  final List<dynamic> avatarThumbnails;

  const YoutiPieMusicBrowseResult({
    this.items = const [],
    this.title,
    this.subtitle,
    this.channelId,
    this.avatarThumbnails = const [],
  });

  String? findSongsPlaylistId() => null;

  dynamic noSuchMethod(Invocation invocation) => null;
}

typedef MusicBrowseResult = YoutiPieMusicBrowseResult;
