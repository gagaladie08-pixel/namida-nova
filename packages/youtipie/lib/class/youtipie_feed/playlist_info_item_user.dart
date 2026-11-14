import 'package:youtipie/class/youtipie_feed/playlist_basic_info.dart';
import 'package:youtipie/core/enum.dart';

class PlaylistInfoItemUser extends PlaylistBasicInfo {
  final List<String>? infoTexts;
  final bool isMix;
  final PlaylistPrivacy? privacy;

  const PlaylistInfoItemUser({
    super.id,
    super.name,
    super.title,
    this.infoTexts,
    this.isMix = false,
    this.privacy,
  });

  dynamic noSuchMethod(Invocation invocation) => null;
}
