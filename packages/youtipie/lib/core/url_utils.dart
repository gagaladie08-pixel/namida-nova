class UrlUtils {
  static String? extractVideoId(String? url) => url;
  static String? extractPlaylistId(String? url) => url;
  static String? extractChannelId(String? url) => url;
}

extension StringVideoIdExt on String {
  bool get isDummyVideoId => this == 'dummy' || isEmpty;
}
