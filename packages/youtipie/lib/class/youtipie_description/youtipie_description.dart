class StylesWrapper {
  final String text;
  final String? attachementUrl;
  final dynamic hashtagParams;
  final dynamic hashtag;

  const StylesWrapper({
    this.text = '',
    this.attachementUrl,
    this.hashtagParams,
    this.hashtag,
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
