class VideoStream {
  final dynamic id;
  final dynamic name;
  final dynamic title;
  final String? qualityLabel;

  const VideoStream({
    this.id,
    this.name,
    this.title,
    this.qualityLabel,
  });

  dynamic noSuchMethod(Invocation invocation) => null;
}
