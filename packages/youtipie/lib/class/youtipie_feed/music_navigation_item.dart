import 'package:flutter/painting.dart';
import 'package:youtipie/class/music/music_browse_endpoint.dart';
import 'package:youtipie/class/youtipie_feed/yt_feed_base.dart';

class MusicNavigationItem extends YoutubeFeed {
  final Color? color;
  @override
  final YoutiPieMusicBrowseEndpoint endpoint;
  @override
  final String title;

  const MusicNavigationItem({
    super.id,
    super.name,
    this.title = '',
    super.subtitle,
    super.thumbnails = const [],
    this.endpoint = const YoutiPieMusicBrowseEndpoint(),
    this.color,
  }) : super(title: title, endpoint: endpoint);

  dynamic noSuchMethod(Invocation invocation) => null;
}
