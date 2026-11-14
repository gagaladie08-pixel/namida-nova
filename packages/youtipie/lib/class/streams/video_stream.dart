class VideoStreamCodecInfo {
  final String container;
  const VideoStreamCodecInfo({this.container = ''});
  String? codecIdentifierIfCustom() => null;
  dynamic noSuchMethod(Invocation invocation) => null;
}

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

  VideoStreamCodecInfo get codecInfo => const VideoStreamCodecInfo();
  dynamic getCachedFileSync(dynamic id) => null;
  String bitrateText() => '';

  dynamic noSuchMethod(Invocation invocation) => null;
}
