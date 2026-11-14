class Thumbnail {
  final String url;
  final int width;
  final int height;

  const Thumbnail({this.url = '', this.width = 0, this.height = 0});
}

typedef YoutiPieThumbnail = Thumbnail;

class YoutiPieVideoThumbnail {
  static List<String> mix(String id) => [];
  static List<String> mixLow(String id) => [];
}
