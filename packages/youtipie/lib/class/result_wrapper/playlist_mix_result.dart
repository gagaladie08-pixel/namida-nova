import 'package:youtipie/class/result_wrapper/list_wrapper_base.dart';

class YoutiPieMixPlaylistResult extends YoutiPieListWrapper<dynamic> {
  @override
  final List<dynamic> items;

  const YoutiPieMixPlaylistResult({this.items = const []});

  dynamic noSuchMethod(Invocation invocation) => null;
}

typedef PlaylistMixResult = YoutiPieMixPlaylistResult;
