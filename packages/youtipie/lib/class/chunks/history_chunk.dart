import 'package:flutter/foundation.dart';
import 'package:youtipie/class/map_serializable.dart';

class YoutiPieHistoryChunk extends MapSerializable {
  final List<dynamic> items;
  final ValueListenable<int> shortsItemsCount;

  YoutiPieHistoryChunk({
    this.items = const [],
    ValueListenable<int>? shortsItemsCount,
  }) : shortsItemsCount = shortsItemsCount ?? ValueNotifier<int>(0);

  dynamic noSuchMethod(Invocation invocation) => null;
}

typedef HistoryChunk = YoutiPieHistoryChunk;
