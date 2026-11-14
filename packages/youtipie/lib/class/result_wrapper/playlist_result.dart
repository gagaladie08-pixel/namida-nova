import 'package:nampack/nampack.dart';
import 'package:youtipie/class/result_wrapper/list_wrapper_base.dart';
import 'package:youtipie/class/result_wrapper/playlist_result_base.dart';
import 'package:youtipie/class/stream_info_item/stream_info_item.dart';
import 'package:youtipie/class/youtipie_feed/playlist_basic_info.dart';
import 'package:youtipie/core/enum.dart';
import 'package:youtipie/youtipie.dart';

class PlaylistHostedParams {
  final Rx<bool> addNewVideosToTop;
  PlaylistHostedParams({Rx<bool>? addNewVideosToTop})
      : addNewVideosToTop = addNewVideosToTop ?? Rx<bool>(false);
  dynamic noSuchMethod(Invocation invocation) => null;
}

class PlaylistUploaderInfo {
  final String? id;
  final String? handler;
  final String? title;
  const PlaylistUploaderInfo({this.id, this.handler, this.title});
  dynamic noSuchMethod(Invocation invocation) => null;
}

class PlaylistInfo {
  final String id;
  final String title;
  final String? description;
  final PlaylistPrivacy? privacy;
  final PlaylistHostedParams hostedParams;
  final PlaylistUploaderInfo? uploader;
  final Rx<bool> isInLibrary;
  final int? viewsCount;
  final String? viewsCountText;
  final List<Thumbnail> thumbnails;

  PlaylistInfo({
    this.id = '',
    this.title = '',
    this.description,
    this.privacy,
    PlaylistHostedParams? hostedParams,
    this.uploader,
    Rx<bool>? isInLibrary,
    this.viewsCount,
    this.viewsCountText,
    this.thumbnails = const [],
  })  : hostedParams = hostedParams ?? PlaylistHostedParams(),
        isInLibrary = isInLibrary ?? Rx<bool>(false);

  dynamic noSuchMethod(Invocation invocation) => null;
}

class YoutiPiePlaylistResult extends YoutiPiePlaylistResultBase implements YoutiPieListWrapper<StreamInfoItem> {
  final PlaylistInfo info;

  YoutiPiePlaylistResult({
    super.id,
    super.name,
    super.title,
    super.basicInfo,
    super.items = const [],
    PlaylistInfo? info,
  }) : info = info ?? PlaylistInfo();

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
