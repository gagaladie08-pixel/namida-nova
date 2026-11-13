class VideoStream {
  final dynamic id;
  final dynamic name;
  final dynamic title;
  final String qualityLabel;
  final int sizeInBytes;

  const VideoStream({
    this.id,
    this.name,
    this.title,
    this.qualityLabel = '',
    this.sizeInBytes = 0,
  });

  String bitrateText() => '';

  dynamic noSuchMethod(Invocation invocation) => null;
}
