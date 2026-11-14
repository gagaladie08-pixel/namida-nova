import 'package:youtipie/youtipie.dart';

class YoutiPieChannelHomeSection {
  final List<dynamic> items;
  final List<Thumbnail> thumbnails;
  final String title;
  final String? playlistId;
  final dynamic id;
  final dynamic name;

  const YoutiPieChannelHomeSection({
    this.items = const [],
    this.thumbnails = const [],
    this.title = '',
    this.playlistId,
    this.id,
    this.name,
  });

  dynamic noSuchMethod(Invocation invocation) => null;
}

typedef ChannelHomeSection = YoutiPieChannelHomeSection;
