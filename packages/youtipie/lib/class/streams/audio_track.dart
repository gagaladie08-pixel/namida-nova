class AudioTrack {
  final dynamic id;
  final dynamic name;
  final dynamic title;
  final String? langCode;
  final String? displayName;
  final bool isDefault;

  const AudioTrack({
    this.id,
    this.name,
    this.title,
    this.langCode,
    this.displayName,
    this.isDefault = false,
  });

  dynamic noSuchMethod(Invocation invocation) => null;
}
