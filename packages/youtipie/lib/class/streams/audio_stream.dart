import 'package:youtipie/class/streams/audio_track.dart';
import 'package:youtipie/class/streams/video_stream.dart';

class AudioStream {
  final dynamic id;
  final dynamic name;
  final dynamic title;
  final int sizeInBytes;
  final Duration? duration;
  final AudioTrack? audioTrack;
  final bool isWebm;
  final int? itag;
  final int? bitrate;

  const AudioStream({
    this.id,
    this.name,
    this.title,
    this.sizeInBytes = 0,
    this.duration,
    this.audioTrack,
    this.isWebm = false,
    this.itag,
    this.bitrate,
  });

  VideoStreamCodecInfo get codecInfo => const VideoStreamCodecInfo();
  String bitrateText() => '';
  String buildUrl() => '';
  static AudioStream fromMap(dynamic map) => const AudioStream();
  Map<String, dynamic> toMap() => {};

  dynamic noSuchMethod(Invocation invocation) => null;
}
