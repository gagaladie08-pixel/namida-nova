class YoutubeFeed {
  final List<dynamic> items;

  const YoutubeFeed({this.items = const []});

  dynamic noSuchMethod(Invocation invocation) => null;
}

typedef YtFeedBase = YoutubeFeed;
