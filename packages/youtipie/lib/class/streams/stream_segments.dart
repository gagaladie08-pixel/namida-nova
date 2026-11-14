import 'package:youtipie/youtipie.dart';

class StreamSegment {
  final String title;
  final int startMS;
  final int endMS;
  final Thumbnail? thumbnail;

  const StreamSegment({
    this.title = '',
    this.startMS = 0,
    this.endMS = 0,
    this.thumbnail,
  });

  int? get startSeconds => startMS ~/ 1000;

  dynamic noSuchMethod(Invocation invocation) => null;
}

extension StreamSegmentListExtension on Iterable<StreamSegment> {
  StreamSegment? findByMillisecond(int ms) => null;
}

typedef StreamSegments = List<StreamSegment>;
