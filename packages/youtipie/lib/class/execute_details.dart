enum CacheDecision {
  cacheOnly,
  cacheOrRequest,
  requestOnly,
}

class ExecuteDetails {
  final bool forceRequest;

  const ExecuteDetails({this.forceRequest = false});

  factory ExecuteDetails.forceRequest() => const ExecuteDetails(forceRequest: true);
  factory ExecuteDetails.cache([dynamic decision]) => const ExecuteDetails();

  static const kForceRequest = ExecuteDetails(forceRequest: true);

  dynamic noSuchMethod(Invocation invocation) => null;
}
