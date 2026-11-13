import 'package:youtipie/class/streams/audio_stream.dart';
import 'package:youtipie/class/streams/video_stream_info.dart';

class VideoStreamsResult {
  final VideoStreamInfo? info;
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
