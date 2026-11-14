import 'package:youtipie/class/channels/channel_info.dart';
import 'package:youtipie/class/youtipie_feed/yt_feed_base.dart';

class MusicAlbumInfoItem extends YoutubeFeed {
  @override
  final String title;
  @override
  final String subtitle;
  final List<ChannelInfoItem> artists;

  const MusicAlbumInfoItem({
    super.id,
    super.name,
    this.title = '',
    this.subtitle = '',
    this.artists = const [],
    super.thumbnails = const [],
    super.endpoint,
  }) : super(title: title, subtitle: subtitle);

  dynamic noSuchMethod(Invocation invocation) => null;
}
