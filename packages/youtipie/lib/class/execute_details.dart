class ExecuteDetails {
  final bool forceRequest;

  const ExecuteDetails({this.forceRequest = false});

  factory ExecuteDetails.forceRequest() => const ExecuteDetails(forceRequest: true);

  static const kForceRequest = ExecuteDetails(forceRequest: true);

  dynamic noSuchMethod(Invocation invocation) => null;
}
