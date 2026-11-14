class YoutiPiePlaylistResultBase {
  final dynamic id;
  final dynamic name;
  final dynamic title;
  const YoutiPiePlaylistResultBase({this.id, this.name, this.title});

  dynamic noSuchMethod(Invocation invocation) => null;
}

typedef PlaylistResultBase = YoutiPiePlaylistResultBase;
