import 'package:youtipie/class/result_wrapper/list_wrapper_base.dart';

class YoutiPieSearchResult extends YoutiPieListWrapper<dynamic> {
  @override
  final List<dynamic> items;

  const YoutiPieSearchResult({this.items = const []});

  dynamic noSuchMethod(Invocation invocation) => null;
}

typedef SearchResult = YoutiPieSearchResult;
