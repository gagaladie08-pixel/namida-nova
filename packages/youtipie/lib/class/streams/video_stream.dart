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
  final int? height;
  final int? bitrate;
  final int? fps;
  final int? itag;

  const VideoStream({
    this.id,
    this.name,
    this.title,
    this.qualityLabel = '',
    this.sizeInBytes = 0,
    this.height,
    this.bitrate,
    this.fps,
    this.itag,
  });

  VideoStreamCodecInfo get codecInfo => const VideoStreamCodecInfo();
  dynamic getCachedFileSync(dynamic id) => null;
  String bitrateText() => '';
  static VideoStream fromMap(dynamic map) => const VideoStream();
  Map<String, dynamic> toMap() => {};

  dynamic noSuchMethod(Invocation invocation) => null;
}
