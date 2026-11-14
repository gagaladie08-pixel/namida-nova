import 'package:youtipie/class/stream_info_item/stream_info_item.dart';

class MissingVideoInfo {
  final dynamic id;
  final String? name;
  final String? title;
  final dynamic videoPage;
  final dynamic date;
  final int? durSeconds;
  final String? channelId;
  final String? channelName;
  final List<Uri> sources;
  final String? subsource;

  const MissingVideoInfo({
    this.id,
    this.name,
    this.title,
    this.videoPage,
    this.date,
    this.durSeconds,
    this.channelId,
    this.channelName,
    this.sources = const [],
    this.subsource,
  });

  String get videoId => (id as String?) ?? '';
  String? get description => null;

  static MissingVideoInfo fromMap(dynamic map) => const MissingVideoInfo();
  StreamInfoItem toStreamInfo() => const StreamInfoItem();

  dynamic noSuchMethod(Invocation invocation) => null;
}
