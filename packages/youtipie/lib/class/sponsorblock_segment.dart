class SponsorBlockSegment {
  final int durationMS;
  final dynamic category;
  final int startMS;
  final int endMS;
  final String uuid;

  const SponsorBlockSegment({
    this.durationMS = 0,
    this.category,
    this.startMS = 0,
    this.endMS = 0,
    this.uuid = '',
  });

  int get segmentStartMS => startMS;
  int get segmentEndMS => endMS;

  dynamic noSuchMethod(Invocation invocation) => null;
}

typedef SponsorblockSegment = SponsorBlockSegment;
