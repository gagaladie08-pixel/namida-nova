import 'package:youtipie/class/streams/audio_track.dart';
import 'package:youtipie/class/streams/stream_base.dart';
import 'package:youtipie/class/streams/video_stream.dart';

class AudioStream extends StreamBase {
  @override
  final int sizeInBytes;
  final Duration? duration;
  final AudioTrack? audioTrack;
  final bool isWebm;
  final int? itag;
  final int bitrate;

  const AudioStream({
    super.id,
    super.name,
    super.title,
    this.sizeInBytes = 0,
    this.duration,
    this.audioTrack,
    this.isWebm = false,
    this.itag,
    this.bitrate = 0,
  }) : super(sizeInBytes: sizeInBytes);

  VideoStreamCodecInfo get codecInfo => const VideoStreamCodecInfo();
  String bitrateText() => '';
  Uri buildUrl() => Uri();
  static AudioStream fromMap(dynamic map) => const AudioStream();
  Map<String, dynamic> toMap() => {};

  dynamic noSuchMethod(Invocation invocation) => null;
}
