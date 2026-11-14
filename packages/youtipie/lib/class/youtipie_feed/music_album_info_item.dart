import 'package:youtipie/class/youtipie_feed/yt_feed_base.dart';

class MusicAlbumInfoItem extends YoutubeFeed {
  @override
  final String title;
  @override
  final String subtitle;

  const MusicAlbumInfoItem({
    super.id,
    super.name,
    this.title = '',
    this.subtitle = '',
    super.thumbnails = const [],
    super.endpoint,
  }) : super(title: title, subtitle: subtitle);

  dynamic noSuchMethod(Invocation invocation) => null;
}
