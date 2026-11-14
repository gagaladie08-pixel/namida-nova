import 'package:youtipie/class/streams/audio_stream.dart';
import 'package:youtipie/class/streams/video_stream.dart';
import 'package:youtipie/class/streams/video_stream_info.dart';
import 'package:youtipie/class/videos/video_playability.dart';

class VideoStreamsResult {
  final VideoStreamInfo? info;
  final List<AudioStream> audioStreams;
  final List<VideoStream> videoStreams;
  final dynamic loudnessDBData;
  final VideoPlayability playability;
  final dynamic id;
  final dynamic name;
  final dynamic title;

  const VideoStreamsResult({
    this.info,
    this.audioStreams = const [],
    this.videoStreams = const [],
    this.loudnessDBData,
    this.playability = const VideoPlayability(),
    this.id,
    this.name,
    this.title,
  });

  dynamic noSuchMethod(Invocation invocation) => null;
}

extension VideoStreamsListExt on List<VideoStream> {
  List<VideoStream> withoutWebmIfNeccessaryOrExperimentalCodecs({bool allowExperimentalCodecs = false}) => this;
}
