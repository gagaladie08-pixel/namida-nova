class StylesWrapper {
  final String text;
  final String? attachementUrl;
  final dynamic hashtagParams;
  final dynamic hashtag;
  final String? videoId;
  final int? videoStartSeconds;
  final String? channelId;
  final String? playlistId;
  final String? link;
  final String? linkClean;
  final bool italic;
  final bool bold;
  final bool strikethrough;

  const StylesWrapper({
    this.text = '',
    this.attachementUrl,
    this.hashtagParams,
    this.hashtag,
    this.videoId,
    this.videoStartSeconds,
    this.channelId,
    this.playlistId,
    this.link,
    this.linkClean,
    this.italic = false,
    this.bold = false,
    this.strikethrough = false,
  });

  dynamic noSuchMethod(Invocation invocation) => null;
}

class YoutipieDescription {
  final dynamic id;
  final dynamic name;
  final dynamic title;
  const YoutipieDescription({this.id, this.name, this.title});

  dynamic noSuchMethod(Invocation invocation) => null;
}
