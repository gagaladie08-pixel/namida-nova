import 'package:youtipie/class/result_wrapper/list_wrapper_base.dart';
import 'package:youtipie/class/stream_info_item/stream_info_item_short.dart';

class YoutiPieShortsSection {
  final Map<int, List<int>> relatedItemsShortsData;
  final Map<int, bool> shortsIndicesLookup;

  const YoutiPieShortsSection({
    this.relatedItemsShortsData = const {},
    this.shortsIndicesLookup = const {},
  });

  StreamInfoItemShort getAsShort(dynamic item) {
    if (item is StreamInfoItemShort) return item;
    return const StreamInfoItemShort();
  }

  dynamic noSuchMethod(Invocation invocation) => null;
}

class YoutiPieRelatedVideosResult extends YoutiPieListWrapper<dynamic> {
  @override
  final List<dynamic> items;
  final YoutiPieShortsSection shortsSection;
  final String? cacheKey;
  final dynamic continuation;
  final String? videoId;
  final bool isPersonalized;

  const YoutiPieRelatedVideosResult({
    this.items = const [],
    this.shortsSection = const YoutiPieShortsSection(),
    this.cacheKey,
    this.continuation,
    this.videoId,
    this.isPersonalized = false,
  });

  dynamic noSuchMethod(Invocation invocation) => null;
}

typedef RelatedVideosResult = YoutiPieRelatedVideosResult;
