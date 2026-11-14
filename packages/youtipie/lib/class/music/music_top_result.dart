import 'package:youtipie/class/youtipie_feed/yt_feed_base.dart';

class YoutiPieMusicTopResult {
  final YoutubeFeed item;
  final List<YoutubeFeed> items;
  final String subtitle;
  final dynamic id;
  final dynamic name;
  final dynamic title;

  const YoutiPieMusicTopResult({
    this.item = const YoutubeFeed(),
    this.items = const [],
    this.subtitle = '',
    this.id,
    this.name,
    this.title,
  });

  dynamic noSuchMethod(Invocation invocation) => null;
}

typedef MusicTopResult = YoutiPieMusicTopResult;
