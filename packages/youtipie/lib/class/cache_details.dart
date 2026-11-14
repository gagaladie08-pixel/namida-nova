enum YoutiPieSection {
  streamInfoItem,
  videoStreams,
  missingInfo,
}

class CacheDetailsBase {
  final dynamic section;
  final dynamic secondary;
  final dynamic accId;

  const CacheDetailsBase([this.section, this.secondary, this.accId]);

  dynamic noSuchMethod(Invocation invocation) => null;
}

typedef CacheDetails = CacheDetailsBase;
