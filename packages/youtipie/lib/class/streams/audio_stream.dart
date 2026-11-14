import 'package:youtipie/class/streams/audio_track.dart';

class AudioStream {
  final dynamic id;
  final dynamic name;
  final dynamic title;
  final int sizeInBytes;
  final Duration? duration;
  final AudioTrack? audioTrack;

  const AudioStream({
    this.id,
    this.name,
    this.title,
    this.sizeInBytes = 0,
    this.duration,
    this.audioTrack,
  });

  String bitrateText() => '';
  static AudioStream fromMap(dynamic map) => const AudioStream();
  Map<String, dynamic> toMap() => {};

  dynamic noSuchMethod(Invocation invocation) => null;
}
