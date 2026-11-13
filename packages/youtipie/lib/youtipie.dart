import 'package:flutter/foundation.dart';

class YoutiPie {
  static dynamic cipher;
  static dynamic potoken;
  static dynamic cookies;
  static final signedInAccounts = ValueNotifier<List<dynamic>>([]);
  static final activeAccountDetails = ValueNotifier<dynamic>(null);
  static dynamic lastSessionFailureReport;
  static String languageCode = 'en';
  static String countryCode = 'US';
  static DateTime lastSessionReset = DateTime.now();
  static dynamic cacheBuilder = _StubCacheBuilder();
  static dynamic channel = _StubChannel();
  static dynamic history = _StubHistory();
  static dynamic missingInfo = _StubMissingInfo();
  static dynamic search = _StubSearch();
  static dynamic videoAction = _StubVideoAction();
  static dynamic playlistAction = _StubPlaylistAction();
  static dynamic userplaylist = _StubUserPlaylist();
  static dynamic video = _StubVideo();
  static void Function(dynamic)? onOperationFailNoAccount;
  static void setDefaultClients(dynamic clients) {}
}

class _StubCacheBuilder {
  dynamic forPlaylistVideos({dynamic playlistId}) => this;
  dynamic forChannel({dynamic channelId}) => this;
  dynamic forChannelAbout({dynamic channelId}) => this;
  dynamic forChannelTab({dynamic channelId, dynamic tab}) => this;
  dynamic forMissingInfo({dynamic videoId}) => this;
  dynamic forStreamInfoItem({dynamic videoId}) => this;
  dynamic forUserPlaylists() => this;
  dynamic withMaxPeriod({dynamic allowedDuration}) => this;
  Future<dynamic> read() async => null;
  dynamic readSync() => null;
  dynamic readSyncRaw() => null;
}

class _StubChannel {
  Future<dynamic> fetchChannelPage({dynamic channelId, dynamic handle, dynamic details}) async => null;
  Future<dynamic> fetchChannelAbout({dynamic channel, dynamic details}) async => null;
  Future<dynamic> fetchChannelTab({dynamic channelId, dynamic tab, dynamic details}) async => null;
}

class _StubHistory {
  Future<dynamic> addVideoToHistory({dynamic videoId}) async => null;
  Future<dynamic> fetchHistory({dynamic details}) async => null;
}

class _StubMissingInfo {
  Future<dynamic> fetchMissingInfo({dynamic videoId}) async => null;
  Future<dynamic> fetchMissingThumbnail({dynamic videoId}) async => null;
}

class _StubSearch {
  Future<dynamic> getSuggestions(dynamic query) async => [];
  Future<dynamic> search(dynamic query, {dynamic filters}) async => null;
}

class _StubVideoAction {
  Future<dynamic> changeLikeStatus({dynamic videoId, dynamic status}) async => null;
}

class _StubPlaylistAction {
  Future<dynamic> addRemoveVideosInPlaylist({dynamic mainList, dynamic onUserPlaylistUpdated}) async => true;
}

class _StubUserPlaylist {
  Future<dynamic> getPlaylistsForVideo(dynamic videoId) async => [];
  Future<dynamic> getUserPlaylists({dynamic details}) async => null;
  Future<dynamic> createPlaylist({dynamic title, dynamic privacy, dynamic mainList}) async => null;
}

class _StubVideo {
  Future<dynamic> fetchVideoInfo(dynamic videoId) async => null;
  Future<dynamic> fetchHlsMasterPlaylist(dynamic url) async => null;
}
