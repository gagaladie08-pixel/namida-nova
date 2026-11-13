import 'package:youtipie/class/result_wrapper/list_wrapper_base.dart';

class YoutiPieMusicBrowseResult extends YoutiPieListWrapper<dynamic> {
  @override
  final List<dynamic> items;

  const YoutiPieMusicBrowseResult({this.items = const []});

  dynamic noSuchMethod(Invocation invocation) => null;
}

typedef MusicBrowseResult = YoutiPieMusicBrowseResult;
