class YoutiPieMusicBrowseEndpoint {
  final dynamic id;
  final dynamic name;
  final dynamic title;
  const YoutiPieMusicBrowseEndpoint([this.id, this.name, this.title]);

  String? extractPlaylistId() => null;

  dynamic noSuchMethod(Invocation invocation) => null;
}

typedef MusicBrowseEndpoint = YoutiPieMusicBrowseEndpoint;
