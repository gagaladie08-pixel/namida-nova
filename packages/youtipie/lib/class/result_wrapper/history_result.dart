import 'package:youtipie/class/chunks/history_chunk.dart';
import 'package:youtipie/class/result_wrapper/list_wrapper_base.dart';

class YoutiPieHistoryResult extends YoutiPieListWrapper<YoutiPieHistoryChunk> {
  @override
  final List<YoutiPieHistoryChunk> items;

  const YoutiPieHistoryResult({this.items = const []});

  dynamic noSuchMethod(Invocation invocation) => null;
}

typedef HistoryResult = YoutiPieHistoryResult;
