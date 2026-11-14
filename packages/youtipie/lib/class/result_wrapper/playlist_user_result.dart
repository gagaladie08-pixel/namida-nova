import 'package:youtipie/class/result_wrapper/list_wrapper_base.dart';
import 'package:youtipie/class/youtipie_feed/playlist_info_item_user.dart';

class YoutiPieUserPlaylistsResult extends YoutiPieListWrapper<PlaylistInfoItemUser> {
  @override
  final List<PlaylistInfoItemUser> items;

  const YoutiPieUserPlaylistsResult({this.items = const []});

  dynamic noSuchMethod(Invocation invocation) => null;
}

typedef PlaylistUserResult = YoutiPieUserPlaylistsResult;
