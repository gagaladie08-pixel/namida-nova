class YoutiPieVideoHeatMap {
  final double value;
  final int startMS;
  final int endMS;

  const YoutiPieVideoHeatMap({
    this.value = 0.0,
    this.startMS = 0,
    this.endMS = 0,
  });

  double get intensity => value;
  int get durationMS => endMS > startMS ? endMS - startMS : 0;

  dynamic noSuchMethod(Invocation invocation) => null;
}

typedef VideoHeatMap = YoutiPieVideoHeatMap;
