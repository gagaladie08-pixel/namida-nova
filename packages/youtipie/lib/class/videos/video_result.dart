import 'package:youtipie/class/streams/stream_segments.dart';
import 'package:youtipie/class/videos/video_heat_map.dart';
import 'package:youtipie/class/videos/video_info.dart';

class YoutiPieVideoPageResult {
  final dynamic id;
  final dynamic name;
  final dynamic title;
  final VideoInfo? videoInfo;
  final List<StreamSegment>? streamSegments;
  final List<YoutiPieVideoHeatMap>? heatMap;

  const YoutiPieVideoPageResult({
    this.id,
    this.name,
    this.title,
    this.videoInfo,
    this.streamSegments,
    this.heatMap,
  });

  dynamic noSuchMethod(Invocation invocation) => null;
}

typedef VideoResult = YoutiPieVideoPageResult;
