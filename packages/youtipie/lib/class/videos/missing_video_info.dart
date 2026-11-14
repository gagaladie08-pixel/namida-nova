import 'package:youtipie/class/stream_info_item/stream_info_item.dart';

class MissingVideoInfo {
  final dynamic id;
  final dynamic name;
  final dynamic title;
  final dynamic videoPage;
  final dynamic date;
  final int? durSeconds;

  const MissingVideoInfo({
    this.id,
    this.name,
    this.title,
    this.videoPage,
    this.date,
    this.durSeconds,
  });

  String? get videoId => id as String?;
  String? get description => null;

  static MissingVideoInfo fromMap(dynamic map) => const MissingVideoInfo();
  StreamInfoItem toStreamInfo() => const StreamInfoItem();

  dynamic noSuchMethod(Invocation invocation) => null;
}
