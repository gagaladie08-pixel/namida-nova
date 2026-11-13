import 'package:youtipie/class/result_wrapper/list_wrapper_base.dart';

class YoutiPieMusicSearchResult extends YoutiPieListWrapper<dynamic> {
  @override
  final List<dynamic> items;

  const YoutiPieMusicSearchResult({this.items = const []});

  dynamic noSuchMethod(Invocation invocation) => null;
}

typedef MusicSearchResult = YoutiPieMusicSearchResult;
