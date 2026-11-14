import 'package:youtipie/class/youtipie_feed/yt_feed_base.dart';

class YoutiPieMusicTopResult {
  final dynamic item;
  final List<YoutubeFeed> items;
  final dynamic id;
  final dynamic name;
  final dynamic title;

  const YoutiPieMusicTopResult({
    this.item,
    this.items = const [],
    this.id,
    this.name,
    this.title,
  });

  dynamic noSuchMethod(Invocation invocation) => null;
}

typedef MusicTopResult = YoutiPieMusicTopResult;
