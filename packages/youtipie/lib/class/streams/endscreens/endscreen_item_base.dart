import 'package:youtipie/core/enum.dart';
import 'package:youtipie/youtipie.dart';

class EndScreenDisplay {
  final double left;
  final double top;
  final double width;
  final double aspectRatio;

  const EndScreenDisplay({
    this.left = 0.0,
    this.top = 0.0,
    this.width = 0.0,
    this.aspectRatio = 16 / 9,
  });

  dynamic noSuchMethod(Invocation invocation) => null;
}

class EndScreenItemBase {
  final VideoEndScreenItemType type;
  final int startMs;
  final int endMs;
  final EndScreenDisplay display;
  final List<Thumbnail> thumbnails;
  final String? title;

  const EndScreenItemBase({
    this.type = VideoEndScreenItemType.unknown,
    this.startMs = 0,
    this.endMs = 0,
    this.display = const EndScreenDisplay(),
    this.thumbnails = const [],
    this.title,
  });

  dynamic noSuchMethod(Invocation invocation) => null;
}

class EndScreenItemVideo extends EndScreenItemBase {
  final String? videoId;
  final int? viewsCount;
  final String? viewsCountText;

  const EndScreenItemVideo({
    super.type = VideoEndScreenItemType.video,
    super.startMs,
    super.endMs,
    super.display,
    super.thumbnails,
    super.title,
    this.videoId,
    this.viewsCount,
    this.viewsCountText,
  });
}

class EndScreenItemChannel extends EndScreenItemBase {
  final String? channelId;

  const EndScreenItemChannel({
    super.type = VideoEndScreenItemType.channel,
    super.startMs,
    super.endMs,
    super.display,
    super.thumbnails,
    super.title,
    this.channelId,
  });
}

class EndScreenItemPlaylist extends EndScreenItemBase {
  final dynamic basicInfo;

  const EndScreenItemPlaylist({
    super.type = VideoEndScreenItemType.playlist,
    super.startMs,
    super.endMs,
    super.display,
    super.thumbnails,
    super.title,
    this.basicInfo,
  });
}
