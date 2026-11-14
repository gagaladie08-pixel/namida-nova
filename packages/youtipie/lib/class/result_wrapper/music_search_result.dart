import 'package:youtipie/class/music/music_search_chip.dart';
import 'package:youtipie/class/music/music_top_result.dart';
import 'package:youtipie/class/result_wrapper/list_wrapper_base.dart';
import 'package:youtipie/class/youtipie_feed/yt_feed_base.dart';

class YoutiPieMusicSearchResult extends YoutiPieListWrapper<YoutubeFeed> {
  @override
  final List<YoutubeFeed> items;
  final YoutiPieMusicTopResult? topResult;
  final String query;
  final List<YoutiPieMusicSearchChip> chips;

  const YoutiPieMusicSearchResult({
    this.items = const [],
    this.topResult,
    this.query = '',
    this.chips = const [],
  });

  dynamic noSuchMethod(Invocation invocation) => null;
}

typedef MusicSearchResult = YoutiPieMusicSearchResult;
