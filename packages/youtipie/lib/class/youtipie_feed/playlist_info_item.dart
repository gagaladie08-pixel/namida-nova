import 'package:youtipie/class/youtipie_feed/playlist_basic_info.dart';

class PlaylistInfoItem extends PlaylistBasicInfo {
  final List<dynamic> initialVideos;
  final String? subtitle;
  final bool isMix;

  const PlaylistInfoItem({
    super.id,
    super.name,
    super.title,
    this.initialVideos = const [],
    this.subtitle,
    this.isMix = false,
  });

  dynamic noSuchMethod(Invocation invocation) => null;
}
