import 'package:youtipie/class/result_wrapper/list_wrapper_base.dart';

class YoutiPieUserPlaylistsResult extends YoutiPieListWrapper<dynamic> {
  @override
  final List<dynamic> items;

  const YoutiPieUserPlaylistsResult({this.items = const []});

  dynamic noSuchMethod(Invocation invocation) => null;
}

typedef PlaylistUserResult = YoutiPieUserPlaylistsResult;
