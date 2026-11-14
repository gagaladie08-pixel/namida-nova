class AudioTrack {
  final dynamic id;
  final dynamic name;
  final dynamic title;
  final String? langCode;
  final String? displayName;

  const AudioTrack({
    this.id,
    this.name,
    this.title,
    this.langCode,
    this.displayName,
  });

  dynamic noSuchMethod(Invocation invocation) => null;
}
