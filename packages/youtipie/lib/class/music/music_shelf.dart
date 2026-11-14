import 'package:youtipie/class/map_serializable.dart';
import 'package:youtipie/class/music/music_browse_endpoint.dart';
import 'package:youtipie/class/youtipie_feed/yt_feed_base.dart';

enum YoutiPieMusicShelfLayout {
  carousel,
  rows,
  list,
  grid,
}

class YoutiPieMusicShelf extends MapSerializable {
  @override
  final dynamic id;
  @override
  final dynamic name;
  @override
  final String title;
  final String? strapline;
  final YoutiPieMusicShelfLayout layout;
  final List<YoutubeFeed> items;
  final int rowsPerColumn;
  final YoutiPieMusicBrowseEndpoint? endpoint;
  final List<dynamic> thumbnails;
  final YoutiPieMusicBrowseEndpoint? moreEndpoint;

  const YoutiPieMusicShelf({
    this.title = '',
    this.strapline,
    this.layout = YoutiPieMusicShelfLayout.carousel,
    this.items = const [],
    this.rowsPerColumn = 4,
    this.endpoint,
    this.thumbnails = const [],
    this.moreEndpoint,
    this.id,
    this.name,
  });

  dynamic noSuchMethod(Invocation invocation) => null;
}

typedef MusicShelf = YoutiPieMusicShelf;
