enum YoutiPieSection {
  streamInfoItem,
  videoStreams,
  missingInfo,
}

class CacheDetailsBase<T> {
  final dynamic section;
  final dynamic secondary;
  final dynamic accId;

  const CacheDetailsBase([this.section, this.secondary, this.accId]);

  Future<T?> read() async => null;
  List<dynamic> readAllMapsSync(dynamic keys) => const [];
  void close() {}
  void loadEverythingExtractedSync(dynamic paths, dynamic callback) {}

  dynamic noSuchMethod(Invocation invocation) => null;
}

typedef CacheDetails<T> = CacheDetailsBase<T>;
