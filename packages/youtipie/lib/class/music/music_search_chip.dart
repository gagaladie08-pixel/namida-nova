import 'package:youtipie/core/enum.dart';

class YoutiPieMusicSearchChip {
  final YoutiPieMusicSearchType? type;
  final String title;
  final bool isSelected;
  final String? params;
  final dynamic id;
  final dynamic name;

  const YoutiPieMusicSearchChip({
    this.type,
    this.title = '',
    this.isSelected = false,
    this.params,
    this.id,
    this.name,
  });

  dynamic noSuchMethod(Invocation invocation) => null;
}

typedef MusicSearchChip = YoutiPieMusicSearchChip;
