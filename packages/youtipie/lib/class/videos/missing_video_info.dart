import 'package:youtipie/class/stream_info_item/stream_info_item.dart';

class MissingVideoInfo {
  final dynamic id;
  final dynamic name;
  final dynamic title;
  const MissingVideoInfo({this.id, this.name, this.title});

  static MissingVideoInfo fromMap(dynamic map) => const MissingVideoInfo();
  StreamInfoItem toStreamInfo() => const StreamInfoItem();

  dynamic noSuchMethod(Invocation invocation) => null;
}
