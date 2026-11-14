import 'package:youtipie/class/result_wrapper/list_wrapper_base.dart';
import 'package:youtipie/class/result_wrapper/playlist_result_base.dart';
import 'package:youtipie/class/stream_info_item/stream_info_item.dart';

export 'package:youtipie/class/result_wrapper/playlist_result_base.dart'
    show PlaylistInfo, PlaylistHostedParams, PlaylistUploaderInfo;

class YoutiPiePlaylistResult extends YoutiPiePlaylistResultBase implements YoutiPieListWrapper<StreamInfoItem> {
  YoutiPiePlaylistResult({
    super.id,
    super.name,
    super.title,
    super.basicInfo,
    super.items = const [],
    super.info,
  });

  String get playlistId => (id as String?) ?? info.id;

  @override
  int get length => items.length;
  @override
  bool get isEmpty => items.isEmpty;
  @override
  bool get isNotEmpty => items.isNotEmpty;
  @override
  StreamInfoItem operator [](int index) => items[index];
  @override
  bool get canFetchNext => false;
  @override
  Future<bool> fetchNext() async => false;
  @override
  void transferLocalItemsTo(dynamic other) {}

  dynamic noSuchMethod(Invocation invocation) => null;
}

typedef PlaylistResult = YoutiPiePlaylistResult;
