import 'package:youtipie/class/youtipie_feed/playlist_basic_info.dart';

class PlaylistInfoItem extends PlaylistBasicInfo {
  final List<dynamic> initialVideos;
  @override
  final String title;
  final String subtitle;
  final bool isMix;

  const PlaylistInfoItem({
    super.id,
    super.name,
    this.title = '',
    this.subtitle = '',
    this.initialVideos = const [],
    this.isMix = false,
  }) : super(title: title);

  dynamic noSuchMethod(Invocation invocation) => null;
}
