class YTPlaylistIdUtils {
  static String? extractPlaylistId(String? url) => url;
  static bool isUserCreated(dynamic id) => true;

  dynamic noSuchMethod(Invocation invocation) => null;
}

typedef PlaylistIdUtils = YTPlaylistIdUtils;
