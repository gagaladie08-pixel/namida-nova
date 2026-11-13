class AudioStream {
  final dynamic id;
  final dynamic name;
  final dynamic title;
  final int sizeInBytes;

  const AudioStream({
    this.id,
    this.name,
    this.title,
    this.sizeInBytes = 0,
  });

  String bitrateText() => '';

  dynamic noSuchMethod(Invocation invocation) => null;
}
