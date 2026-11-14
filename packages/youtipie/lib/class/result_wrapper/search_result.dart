import 'package:flutter/foundation.dart';
import 'package:youtipie/class/result_wrapper/list_wrapper_base.dart';

class YoutiPieSearchChunk {
  final List<dynamic> items;
  final ValueListenable<int> shortsItemsCount;
  final ValueListenable<int> mixesPlaylistCount;
  final String title;

  YoutiPieSearchChunk({
    this.items = const [],
    ValueListenable<int>? shortsItemsCount,
    ValueListenable<int>? mixesPlaylistCount,
    this.title = '',
  })  : shortsItemsCount = shortsItemsCount ?? ValueNotifier<int>(0),
        mixesPlaylistCount = mixesPlaylistCount ?? ValueNotifier<int>(0);

  dynamic noSuchMethod(Invocation invocation) => null;
}

class YoutiPieSearchResult extends YoutiPieListWrapper<YoutiPieSearchChunk> {
  @override
  final List<YoutiPieSearchChunk> items;
  final List<dynamic> correctedQuery;

  const YoutiPieSearchResult({
    this.items = const [],
    this.correctedQuery = const [],
  });

  dynamic noSuchMethod(Invocation invocation) => null;
}

typedef SearchResult = YoutiPieSearchResult;
