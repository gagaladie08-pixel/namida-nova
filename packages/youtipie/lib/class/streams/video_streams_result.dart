import 'package:youtipie/class/streams/audio_stream.dart';
import 'package:youtipie/class/streams/endscreens/endscreen_item_base.dart';
import 'package:youtipie/class/streams/video_stream.dart';
import 'package:youtipie/class/streams/video_stream_info.dart';
import 'package:youtipie/class/videos/video_playability.dart';

class VideoStreamsResult {
  final VideoStreamInfo? info;
  final List<AudioStream> audioStreams;
  final List<VideoStream> videoStreams;
  final dynamic loudnessDBData;
  final VideoPlayability playability;
  final dynamic overlay;
  final List<EndScreenItemBase>? endscreens;
  final dynamic id;
  final dynamic name;
  final dynamic title;
  final List<VideoStream> mixedStreams;
  final String? hlsManifestUrl;
  final String? dashManifestUrl;
  final String? statsPlaybackUrl;
  final String? statsWatchtimeUrl;
  final dynamic client;
  final dynamic failureReport;

  const VideoStreamsResult({
    this.info,
    this.audioStreams = const [],
    this.videoStreams = const [],
    this.mixedStreams = const [],
    this.hlsManifestUrl,
    this.dashManifestUrl,
    this.statsPlaybackUrl,
    this.statsWatchtimeUrl,
    this.client,
    this.failureReport,
    this.loudnessDBData,
    this.playability = const VideoPlayability(),
    this.overlay,
    this.endscreens,
    this.id,
    this.name,
    this.title,
  });

  String get videoId => (id ?? info?.id ?? '').toString();
  Map<dynamic, AudioStream>? get audioStreamsOrganizedByLanguage => null;

  bool hasExpired() => false;
  Map<String, dynamic> toMap() => {};

  dynamic noSuchMethod(Invocation invocation) => null;
}

extension VideoStreamsListExt on List<VideoStream> {
  List<VideoStream> withoutWebmIfNeccessaryOrExperimentalCodecs({bool allowExperimentalCodecs = false}) => this;
}
