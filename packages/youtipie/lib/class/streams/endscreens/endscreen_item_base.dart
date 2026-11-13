import 'package:youtipie/core/enum.dart';

class EndScreenItemBase {
  final VideoEndScreenItemType type;

  const EndScreenItemBase({
    this.type = VideoEndScreenItemType.unknown,
  });

  dynamic noSuchMethod(Invocation invocation) => null;
}

class EndScreenItemPlaylist extends EndScreenItemBase {
  final dynamic basicInfo;

  const EndScreenItemPlaylist({
    super.type = VideoEndScreenItemType.playlist,
    this.basicInfo,
  });
}
