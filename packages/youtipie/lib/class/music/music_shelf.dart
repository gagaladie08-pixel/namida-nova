import 'package:youtipie/class/music/music_browse_endpoint.dart';

enum YoutiPieMusicShelfLayout {
  carousel,
  rows,
  list,
  grid,
}

class YoutiPieMusicShelf {
  final String title;
  final String? strapline;
  final YoutiPieMusicShelfLayout layout;
  final List<dynamic> items;
  final int rowsPerColumn;
  final YoutiPieMusicBrowseEndpoint? endpoint;
  final dynamic id;
  final dynamic name;

  const YoutiPieMusicShelf({
    this.title = '',
    this.strapline,
    this.layout = YoutiPieMusicShelfLayout.carousel,
    this.items = const [],
    this.rowsPerColumn = 4,
    this.endpoint,
    this.id,
    this.name,
  });

  dynamic noSuchMethod(Invocation invocation) => null;
}

typedef MusicShelf = YoutiPieMusicShelf;
