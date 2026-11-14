class YoutiPieMusicFormOption {
  final String title;
  final bool isSelected;
  final String value;
  final dynamic id;
  final dynamic name;

  const YoutiPieMusicFormOption({
    this.title = '',
    this.isSelected = false,
    this.value = '',
    this.id,
    this.name,
  });

  dynamic noSuchMethod(Invocation invocation) => null;
}

typedef MusicFormOption = YoutiPieMusicFormOption;
