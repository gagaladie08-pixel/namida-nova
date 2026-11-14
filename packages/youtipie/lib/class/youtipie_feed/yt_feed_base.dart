import 'package:youtipie/class/map_serializable.dart';

class YoutubeFeed extends MapSerializable {
  @override
  final dynamic id;
  @override
  final dynamic name;
  @override
  final dynamic title;
  final List<dynamic> items;
  final List<dynamic> initialVideos;
  final String? subtitle;
  final bool isMix;
  final bool isShortContent;
  final bool isMixPlaylist;
  final dynamic shortsSection;
  final List<dynamic> thumbnails;
  final dynamic endpoint;

  const YoutubeFeed({
    this.id,
    this.name,
    this.title,
    this.items = const [],
    this.initialVideos = const [],
    this.subtitle,
    this.isMix = false,
    this.isShortContent = false,
    this.isMixPlaylist = false,
    this.shortsSection,
    this.thumbnails = const [],
    this.endpoint,
  });

  dynamic noSuchMethod(Invocation invocation) => null;
}

typedef YtFeedBase = YoutubeFeed;
