import 'package:youtipie/class/youtipie_feed/yt_feed_base.dart';

class MusicAlbumInfoItem extends YoutubeFeed {
  const MusicAlbumInfoItem({
    super.id,
    super.name,
    super.title,
    super.subtitle,
    super.thumbnails = const [],
    super.endpoint,
  });

  dynamic noSuchMethod(Invocation invocation) => null;
}
