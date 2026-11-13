import 'package:flutter/foundation.dart';
import 'package:youtipie/class/result_wrapper/hashtag_result.dart';
import 'package:youtipie/class/result_wrapper/comment_result.dart';
import 'package:youtipie/class/result_wrapper/comment_reply_result.dart';
import 'package:youtipie/class/result_wrapper/history_result.dart';
import 'package:youtipie/class/result_wrapper/channel_user_result.dart';

class Thumbnail {
  final String? url;
  final int? width;
  final int? height;

  const Thumbnail({this.url, this.width, this.height});
}

extension ThumbnailListExtension on Iterable<dynamic>? {
  dynamic pick() {
    if (this == null || this!.isEmpty) return null;
    return this!.first;
  }
}

class YoutiPie {
  static const cipher = _StubCipher();
  static const potoken = _StubPotoken();
  static const cookies = _StubCookies();
  static final signedInAccounts = ValueNotifier<List<dynamic>>([]);
  static final activeAccountDetails = ValueNotifier<dynamic>(null);
  static dynamic lastSessionFailureReport;
  static String languageCode = 'en';
  static String countryCode = 'US';
  static DateTime lastSessionReset = DateTime.now();
  static const cacheBuilder = _StubCacheBuilder();
  static const channel = _StubChannel();
  static const history = _StubHistory();
  static const missingInfo = _StubMissingInfo();
  static const search = _StubSearch();
  static const videoAction = _StubVideoAction();
  static const playlistAction = _StubPlaylistAction();
  static const playlist = _StubPlaylist();
  static const userplaylist = _StubUserPlaylist();
  static const userchannel = _StubUserChannel();
  static const comment = _StubComment();
  static const commentAction = _StubCommentAction();
  static const notificationsAction = _StubNotificationsAction();
  static const feedbackAction = _StubFeedbackAction();
  static const feed = _StubFeed();
  static const hashtag = _StubHashtag();
  static const video = _StubVideo();

  static void Function(dynamic)? onOperationFailNoAccount;
  static void setDefaultClients(dynamic clients) {}
}

class _StubCipher {
  const _StubCipher();
  bool get isPrepared => true;
  dynamic noSuchMethod(Invocation invocation) => null;
}

class _StubPotoken {
  const _StubPotoken();
  dynamic noSuchMethod(Invocation invocation) => null;
}

class _StubCookies {
  const _StubCookies();
  dynamic noSuchMethod(Invocation invocation) => null;
}

class _StubCacheBuilder {
  const _StubCacheBuilder();
  dynamic forPlaylistVideos({dynamic playlistId}) => this;
  dynamic forChannel({dynamic channelId}) => this;
  dynamic forChannelAbout({dynamic channelId}) => this;
  dynamic forChannelTab({dynamic channelId, dynamic tab}) => this;
  dynamic forMissingInfo({dynamic videoId}) => this;
  dynamic forStreamInfoItem({dynamic videoId}) => this;
  dynamic forUserPlaylists() => this;
  dynamic forUserChannels() => this;
  dynamic forHistory() => this;
  dynamic forHistoryVideos() => this;
  dynamic forHashtag({dynamic params}) => this;
  dynamic forNotificationComments({dynamic videoId, dynamic linkedCommentId}) => this;
  dynamic forCommentReplies({dynamic commentId}) => this;
  dynamic forFeedItems() => this;
  dynamic withMaxPeriod({dynamic allowedDuration}) => this;
  Future<dynamic> read() async => null;
  dynamic readSync() => null;
  dynamic readSyncRaw() => null;
}

class _StubChannel {
  const _StubChannel();
  Future<dynamic> fetchChannelPage({dynamic channelId, dynamic handle, dynamic details}) async => null;
  Future<dynamic> fetchChannelAbout({dynamic channel, dynamic details}) async => null;
  Future<dynamic> fetchChannelTab({dynamic channelId, dynamic tab, dynamic details}) async => null;
  dynamic noSuchMethod(Invocation invocation) => null;
}

class _StubHistory {
  const _StubHistory();
  Future<dynamic> addVideoToHistory({dynamic videoId}) async => null;
  Future<YoutiPieHistoryResult?> fetchHistory({dynamic details}) async => null;
  dynamic noSuchMethod(Invocation invocation) => null;
}

class _StubMissingInfo {
  const _StubMissingInfo();
  Future<dynamic> fetchMissingInfo({dynamic videoId}) async => null;
  Future<dynamic> fetchMissingThumbnail({dynamic videoId}) async => null;
  dynamic noSuchMethod(Invocation invocation) => null;
}

class _StubSearch {
  const _StubSearch();
  Future<dynamic> getSuggestions(dynamic query) async => [];
  Future<dynamic> search(dynamic query, {dynamic filters}) async => null;
  dynamic noSuchMethod(Invocation invocation) => null;
}

class _StubVideoAction {
  const _StubVideoAction();
  Future<dynamic> changeLikeStatus({dynamic videoId, dynamic status}) async => null;
  dynamic noSuchMethod(Invocation invocation) => null;
}

class _StubPlaylistAction {
  const _StubPlaylistAction();
  Future<dynamic> addRemoveVideosInPlaylist({dynamic mainList, dynamic onUserPlaylistUpdated}) async => true;
  dynamic noSuchMethod(Invocation invocation) => null;
}

class _StubPlaylist {
  const _StubPlaylist();
  dynamic noSuchMethod(Invocation invocation) => null;
}

class _StubUserPlaylist {
  const _StubUserPlaylist();
  Future<dynamic> getPlaylistsForVideo(dynamic videoId) async => [];
  Future<dynamic> getUserPlaylists({dynamic details}) async => null;
  Future<dynamic> createPlaylist({dynamic title, dynamic privacy, dynamic mainList}) async => null;
  dynamic noSuchMethod(Invocation invocation) => null;
}

class _StubUserChannel {
  const _StubUserChannel();
  Future<YoutiPieUserChannelsResult?> fetchUserChannels({dynamic details}) async => null;
  dynamic noSuchMethod(Invocation invocation) => null;
}

class _StubComment {
  const _StubComment();
  Future<YoutiPieCommentReplyResult?> fetchCommentReplies({dynamic mainComment, dynamic details}) async => null;
  Future<YoutiPieCommentResult?> fetchNotificationComments({dynamic videoId, dynamic linkedCommentId, dynamic details}) async => null;
  dynamic noSuchMethod(Invocation invocation) => null;
}

class _StubCommentAction {
  const _StubCommentAction();
  dynamic noSuchMethod(Invocation invocation) => null;
}

class _StubNotificationsAction {
  const _StubNotificationsAction();
  dynamic noSuchMethod(Invocation invocation) => null;
}

class _StubFeedbackAction {
  const _StubFeedbackAction();
  dynamic noSuchMethod(Invocation invocation) => null;
}

class _StubFeed {
  const _StubFeed();
  Future<dynamic> fetchFeed({dynamic details}) async => null;
  dynamic noSuchMethod(Invocation invocation) => null;
}

class _StubHashtag {
  const _StubHashtag();
  Future<YoutiPieHashtagResult?> fetchHashtag({dynamic params, dynamic details}) async => null;
  dynamic noSuchMethod(Invocation invocation) => null;
}

class _StubVideo {
  const _StubVideo();
  Future<dynamic> fetchVideoInfo(dynamic videoId) async => null;
  Future<dynamic> fetchHlsMasterPlaylist(dynamic url) async => null;
  dynamic noSuchMethod(Invocation invocation) => null;
}
