import 'package:youtipie/class/result_wrapper/list_wrapper_base.dart';

class YoutiPiePlaylistResult extends YoutiPieListWrapper<dynamic> {
  @override
  final List<dynamic> items;

  const YoutiPiePlaylistResult({this.items = const []});

  dynamic noSuchMethod(Invocation invocation) => null;
}

typedef PlaylistResult = YoutiPiePlaylistResult;
