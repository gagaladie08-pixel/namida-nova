class SponsorBlockSegment {
  final int durationMS;
  final dynamic category;
  final int startMS;
  final int endMS;

  const SponsorBlockSegment({
    this.durationMS = 0,
    this.category,
    this.startMS = 0,
    this.endMS = 0,
  });

  dynamic noSuchMethod(Invocation invocation) => null;
}

typedef SponsorblockSegment = SponsorBlockSegment;
