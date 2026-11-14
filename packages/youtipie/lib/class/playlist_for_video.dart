import 'package:youtipie/core/enum.dart';

class PlaylistForVideoItem {
  final String playlistId;
  final String? playlistTitle;
  final PlaylistPrivacy? privacy;
  final bool? containsVideo;
  final dynamic id;
  final dynamic name;
  final dynamic title;

  const PlaylistForVideoItem({
    this.playlistId = '',
    this.playlistTitle,
    this.privacy,
    this.containsVideo,
    this.id,
    this.name,
    this.title,
  });

  dynamic noSuchMethod(Invocation invocation) => null;
}

typedef PlaylistForVideo = PlaylistForVideoItem;
