import 'package:youtipie/class/sponsorblock_segment.dart';

class SponsorBlockSegmentsResult {
  final int videoDurationMS;
  final List<SponsorBlockSegment> segments;
  final SponsorBlockSegment? poi_highlight;

  const SponsorBlockSegmentsResult({
    this.videoDurationMS = 0,
    this.segments = const [],
    this.poi_highlight,
  });

  int? get firstMS => segments.isEmpty ? null : segments.first.startMS;
  int? get lastMS => segments.isEmpty ? null : segments.last.endMS;

  dynamic noSuchMethod(Invocation invocation) => null;
}

typedef SponsorblockSegmentsResult = SponsorBlockSegmentsResult;
