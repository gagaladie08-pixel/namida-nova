import 'package:youtipie/class/music/music_browse_endpoint.dart';

class YoutiPieMusicChip {
  final String title;
  final bool isSelected;
  final YoutiPieMusicBrowseEndpoint endpoint;
  final dynamic id;
  final dynamic name;

  const YoutiPieMusicChip({
    this.title = '',
    this.isSelected = false,
    this.endpoint = const YoutiPieMusicBrowseEndpoint(),
    this.id,
    this.name,
  });

  dynamic noSuchMethod(Invocation invocation) => null;
}

typedef MusicChip = YoutiPieMusicChip;
