enum VideoPlayabiltyStatus {
  ok,
  playable,
  unplayable,
  error,
}

typedef VideoPlayabilityStatus = VideoPlayabiltyStatus;

class VideoPlayability {
  final VideoPlayabiltyStatus status;
  final String? reason;
  final List<String> messages;

  const VideoPlayability({
    this.status = VideoPlayabiltyStatus.ok,
    this.reason,
    this.messages = const [],
  });

  dynamic noSuchMethod(Invocation invocation) => null;
}

typedef VideoPlayabilty = VideoPlayability;
