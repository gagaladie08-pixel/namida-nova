import 'package:youtipie/class/stream_info_item/stream_info_item.dart';
import 'package:youtipie/class/streams/audio_stream.dart';

class VideoStreamsResult {
  final StreamInfoItem? info;
  final List<AudioStream> audioStreams;
  final dynamic id;
  final dynamic name;
  final dynamic title;

  const VideoStreamsResult({
    this.info,
    this.audioStreams = const [],
    this.id,
    this.name,
    this.title,
  });

  dynamic noSuchMethod(Invocation invocation) => null;
}
