import 'dart:async';

class SharedFile {
  final String? value;
  final String? realPath;
  final SharedMediaType? type;
  final String? thumbnail;
  final Duration? duration;

  const SharedFile({
    this.value,
    this.realPath,
    this.type,
    this.thumbnail,
    this.duration,
  });

  Map<String, dynamic> toMap() => {
    'value': value,
    'realPath': realPath,
  };
}

enum SharedMediaType { image, video, text, file }

class FlutterSharingIntent {
  static final FlutterSharingIntent instance = FlutterSharingIntent._();
  FlutterSharingIntent._();

  final _controller = StreamController<List<SharedFile>>.broadcast();

  Future<List<SharedFile>> getInitialSharing() async => const [];

  Stream<List<SharedFile>> getMediaStream() => _controller.stream;

  void reset() {}
}
