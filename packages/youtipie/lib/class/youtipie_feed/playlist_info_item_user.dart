import 'package:youtipie/class/youtipie_feed/playlist_basic_info.dart';

class PlaylistInfoItemUser extends PlaylistBasicInfo {
  final List<String>? infoTexts;
  final bool isMix;

  const PlaylistInfoItemUser({
    super.id,
    super.name,
    super.title,
    this.infoTexts,
    this.isMix = false,
  });

  dynamic noSuchMethod(Invocation invocation) => null;
}
