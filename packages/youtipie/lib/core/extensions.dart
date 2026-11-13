class StreamFilterVideoUtils {}
class CodecInfoUtils {}

class Thumbnail {
  final String? url;
  final int? width;
  final int? height;

  const Thumbnail({this.url, this.width, this.height});
}

extension ThumbnailListExtension on Iterable<dynamic>? {
  dynamic pick() {
    if (this == null || this!.isEmpty) return null;
    return this!.first;
  }
}
