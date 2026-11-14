class YTUrlUtils {
  static String? extractVideoId(String? url) => url;
  static String? extractPlaylistId(String? url) => url;
  static String? extractChannelId(String? url) => url;
  static String buildVideoUrl(String videoId, {int? timestampSeconds}) => 'https://youtube.com/watch?v=$videoId';
  static String buildChannelUrl(String channelId) => 'https://youtube.com/channel/$channelId';
  static String buildPlaylistUrl(String playlistId) => 'https://youtube.com/playlist?list=$playlistId';

  dynamic noSuchMethod(Invocation invocation) => null;
}

typedef UrlUtils = YTUrlUtils;

extension StringVideoIdExt on String {
  bool get isDummyVideoId => this == 'dummy' || isEmpty;
}
