class Thumbnail {
  final dynamic id;
  final dynamic name;
  final dynamic title;
  const Thumbnail({this.id, this.name, this.title});

  dynamic noSuchMethod(Invocation invocation) => null;
}

class YoutiPieVideoThumbnail {
  static List<String> mix(String id) => [];
  static List<String> mixLow(String id) => [];
}
