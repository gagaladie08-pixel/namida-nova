class YoutiPieMusicFormOption {
  final String title;
  final bool isSelected;
  final dynamic id;
  final dynamic name;

  const YoutiPieMusicFormOption({
    this.title = '',
    this.isSelected = false,
    this.id,
    this.name,
  });

  dynamic noSuchMethod(Invocation invocation) => null;
}

typedef MusicFormOption = YoutiPieMusicFormOption;
