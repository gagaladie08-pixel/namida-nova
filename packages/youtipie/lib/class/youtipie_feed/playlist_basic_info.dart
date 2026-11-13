import 'package:youtipie/class/youtipie_feed/yt_feed_base.dart';

class PlaylistBasicInfo extends YoutubeFeed {
  @override
  final dynamic id;
  @override
  final dynamic name;
  @override
  final dynamic title;

  const PlaylistBasicInfo({this.id, this.name, this.title});

  dynamic noSuchMethod(Invocation invocation) => null;
}
