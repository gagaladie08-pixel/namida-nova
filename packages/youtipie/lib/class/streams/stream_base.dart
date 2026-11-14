class StreamBase {
  final dynamic id;
  final dynamic name;
  final dynamic title;
  final int sizeInBytes;

  const StreamBase({
    this.id,
    this.name,
    this.title,
    this.sizeInBytes = 0,
  });

  dynamic noSuchMethod(Invocation invocation) => null;
}
