import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:nampack/nampack.dart';
import 'package:youtipie/core/enum.dart';
import 'package:youtipie/class/result_wrapper/hashtag_result.dart';
import 'package:youtipie/class/result_wrapper/comment_result.dart';
import 'package:youtipie/class/result_wrapper/comment_reply_result.dart';
import 'package:youtipie/class/result_wrapper/history_result.dart';
import 'package:youtipie/class/result_wrapper/channel_user_result.dart';
import 'package:youtipie/class/result_wrapper/feed_result.dart';
import 'package:youtipie/class/result_wrapper/feedback_holder.dart';
import 'package:youtipie/class/result_wrapper/notification_result.dart';
import 'package:youtipie/class/result_wrapper/playlist_result_base.dart';
import 'package:youtipie/class/result_wrapper/playlist_user_result.dart';
import 'package:youtipie/class/result_wrapper/user_channels_all_videos_result.dart';
import 'package:youtipie/class/youtipie_feed/user_channel_info.dart';
import 'package:youtipie/class/result_wrapper/related_videos_result.dart';
import 'package:youtipie/class/result_wrapper/search_result.dart';
import 'package:youtipie/class/channels/channel_tab_result.dart';
import 'package:youtipie/class/search_suggestion_info.dart';
import 'package:youtipie/class/streams/hls_variant.dart';
import 'package:youtipie/class/streams/video_streams_result.dart';
import 'package:youtipie/class/videos/video_result.dart';

export 'package:youtipie/core/enum.dart';
export 'package:youtipie/class/thumbnail.dart';
export 'package:youtipie/class/execute_details.dart';
export 'package:youtipie/core/url_utils.dart';
export 'package:youtipie/class/streams/stream_segments.dart';
export 'package:youtipie/class/streams/hls_variant.dart';

extension YTStringUtils on String {
  bool get isDummyVideoId => this == 'dummy' || isEmpty;
  bool isYTTitleFaulty() {
    if (trim().isEmpty) return true;
    if (this == '-') return true;
    return false;
  }
}

extension ThumbnailListExtension<E> on Iterable<E>? {
  E? pick() {
    final self = this;
    if (self == null || self.isEmpty) return null;
    return self.first;
  }
}

typedef YoutiLoginProgressCallback = void Function(YoutiLoginProgress progress, [AccountCookiesValidity? cookiesValidity]);

class YoutiPie {
  static const cipher = _StubCipher();
  static const potoken = _StubPotoken();
  static final cookies = _StubCookies();
  static final signedInAccounts = ValueNotifier<List<dynamic>>([]);
  static final activeAccountDetails = ValueNotifier<dynamic>(null);
  static dynamic lastSessionFailureReport;
  static String languageCode = 'en';
  static String countryCode = 'US';
  static DateTime lastSessionReset = DateTime.now();
  static const cacheBuilder = _StubCacheBuilder();
  static const channel = _StubChannel();
  static const channelAction = _StubChannelAction();
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
  static const music = _StubService();
  static const sponsorblock = _StubService();
  static const returnyoutubedislike = _StubService();
  static final dynamic memoryCache = _StubMemoryCache();
  static const cacheManager = _StubCacheManager();
  static const cacheManagerSync = _StubCacheManager();
  static Future<dynamic> getActiveAccountChannelIsolate(dynamic dir, {dynamic encryptionKey}) async => null;

  static bool Function(dynamic)? canExecuteOperation;
  static bool Function(dynamic)? onOperationFailNoAccount;
  static void Function(dynamic message, Object? error, StackTrace? stackTrace)? onWorkerError;
  static void setDefaultClients(dynamic clients) {}
  static void setLogs(dynamic logs) {}
  static void setProxySettings(dynamic settings) {}
  static void initialize({
    dynamic dataDirectory,
    dynamic sensitiveDataDirectory,
    dynamic sensitiveDataEncryptionKey,
    dynamic isNewSensitiveDataEncryptionKey,
    dynamic checkJSPlayer,
    dynamic checkHasConnectionCallback,
    dynamic syncItemsCompleter,
    dynamic accountCompleter,
  }) {}
  static void dispose() {}
  static Future<void> resetSession() async {}
}

class _StubService {
  const _StubService();

  Future<dynamic> search(dynamic query, {dynamic params, dynamic details}) async => null;
  Future<dynamic> browse(dynamic endpoint, {dynamic details}) async => null;
  Future<dynamic> getSegments(dynamic videoId, {dynamic categories, dynamic serverAddress, dynamic details}) async => null;
  void trackSkippedSegment(dynamic segmentId, {dynamic serverAddress}) {}
  Future<dynamic> fetchDislikes(dynamic videoId) async => null;
  Future<void> sendVoteAction(dynamic videoId, dynamic action) async {}
  dynamic noSuchMethod(Invocation invocation) => null;
}

class _StubMemoryCache {
  dynamic noSuchMethod(Invocation invocation) => null;
}

class _StubCacheManager {
  const _StubCacheManager();
  void init(dynamic dir) {}
  void closeAll() {}
  dynamic noSuchMethod(Invocation invocation) => null;
}

class _StubCipher {
  const _StubCipher();
  bool get isPrepared => true;
  String? get jsPlayerVersion => null;
  int? get signatureTimestamp => null;
  bool get didFailedToExtractJsCode => false;
  Future<bool> prepareJSPlayer({dynamic cacheDirectoryPath}) async => true;
  dynamic noSuchMethod(Invocation invocation) => null;
}

class _StubPotoken {
  const _StubPotoken();
  bool get hasPoToken => false;
  DateTime? get lastRefreshed => null;
  String? getVisitorData() => null;
  void updateInfo({dynamic potoken, dynamic visitorData, dynamic playerRequestPoToken, dynamic streamingPoToken}) {}
  dynamic noSuchMethod(Invocation invocation) => null;
}

class _StubCookies {
  bool canAddMultiAccounts = false;
  final activeAccountChannel = Rxn<UserChannelInfo>();
  final signedInAccounts = Rx<List<dynamic>>([]);
  bool get canAuthorizeRequests => false;

  bool isSessionExpired(dynamic account) => false;
  void signOut(dynamic userChannel) {}
  void setAccount(dynamic userChannel) {}
  void setAnonymous() {}
  void addOnAccountChanged(dynamic callback) {}
  void removeOnAccountChanged(dynamic callback) {}

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
  dynamic forUserChannelsAllVideos() => this;
  dynamic forHashtag({dynamic params}) => this;
  dynamic forNotificationComments({dynamic videoId, dynamic linkedCommentId}) => this;
  dynamic forCommentReplies({dynamic commentId}) => this;
  dynamic forComments({dynamic videoId, dynamic createCommentParams, dynamic continuationToken}) => this;
  dynamic forVideoPage({dynamic videoId}) => this;
  dynamic forReturnYoutubeDislike({dynamic videoId}) => this;
  dynamic forVideoStreams({dynamic videoId}) => this;
  dynamic forMixPlaylistVideos({dynamic videoId, dynamic mixId, dynamic userPersonalized}) => this;
  dynamic forRelatedVideos({dynamic videoId, dynamic params, dynamic userPersonalized}) => this;
  dynamic forNotificationItems() => this;
  dynamic forMusicBrowse({dynamic endpoint}) => this;
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
  Future<YoutiPieChannelTabResult?> fetchChannelTab({dynamic channelId, dynamic tab, dynamic sort, dynamic details}) async => null;
  dynamic noSuchMethod(Invocation invocation) => null;
}

class ChannelSubscribeActionResult {
  final bool isNowSubbed;
  final dynamic newNotificationStatus;
  const ChannelSubscribeActionResult({this.isNowSubbed = true, this.newNotificationStatus});
}

class _StubChannelAction {
  const _StubChannelAction();
  Future<ChannelSubscribeActionResult?> changeSubscribeStatus({dynamic channelId, dynamic channelEngagement, dynamic status, dynamic mainChannelInfo, dynamic subscribe}) async => const ChannelSubscribeActionResult();
  Future<bool> changeChannelNotificationStatus({dynamic channelId, dynamic status, dynamic parameters, dynamic mainChannelInfo, dynamic notifications}) async => true;
  dynamic noSuchMethod(Invocation invocation) => null;
}

class _StubHistory {
  const _StubHistory();
  Future<(bool, dynamic)> addVideoToHistory({dynamic videoId, dynamic statsPlaybackUrl, dynamic statsWatchtimeUrl}) async => (false, null);
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
  Future<List<SearchSuggestionInfo>?> getSuggestions(dynamic query, {dynamic details}) async => [];
  Future<YoutiPieSearchResult?> search(dynamic query, {dynamic filters, dynamic details, dynamic peopleAlsoWatched}) async => null;
  dynamic noSuchMethod(Invocation invocation) => null;
}

class _StubVideoAction {
  const _StubVideoAction();
  Future<dynamic> changeLikeStatus({dynamic videoId, dynamic status, dynamic engagement, dynamic videoPage, dynamic action}) async => true;
  dynamic noSuchMethod(Invocation invocation) => null;
}

class _StubPlaylistAction {
  const _StubPlaylistAction();
  Future<dynamic> addRemoveVideosInPlaylist({
    dynamic videosToAdd,
    dynamic videosToRemove,
    dynamic playlistId,
    dynamic mainList,
    dynamic onUserPlaylistUpdated,
  }) async => true;
  dynamic noSuchMethod(Invocation invocation) => null;
}

class _StubPlaylist {
  const _StubPlaylist();
  Future<YoutiPiePlaylistResultBase?> getMixPlaylist({dynamic videoId, dynamic mixId, dynamic includeFirstVideo, dynamic userPersonalized, dynamic details}) async => null;
  Future<YoutiPiePlaylistResultBase?> fetchPlaylist({dynamic playlistId, dynamic details}) async => null;
  dynamic noSuchMethod(Invocation invocation) => null;
}

class _StubUserPlaylist {
  const _StubUserPlaylist();
  final int MAX_PLAYLIST_NAME = 150;
  final int MAX_PLAYLIST_DESCRIPTION = 5000;
  String? validatePlaylistTitle(String title) => null;
  Future<dynamic> getPlaylistEditInfo(dynamic playlistId) async => null;
  Future<dynamic> removeHostedPlaylistFromLibrary({dynamic playlist, dynamic playlistId}) async => true;
  Future<dynamic> addHostedPlaylistToLibrary({dynamic playlist, dynamic playlistId}) async => true;
  Future<dynamic> editPlaylist({
    dynamic mainList,
    dynamic playlists,
    dynamic playlistId,
    dynamic title,
    dynamic description,
    dynamic privacy,
    dynamic newVideosAtTop,
  }) async => true;
  Future<dynamic> getPlaylistsForVideo({dynamic videoId, dynamic insertActiveAtTop}) async => [];
  Future<YoutiPieUserPlaylistsResult?> getUserPlaylists({dynamic details}) async => null;
  Future<dynamic> createPlaylist({dynamic title, dynamic privacy, dynamic mainList, dynamic initialVideoIds}) async => null;
  Future<dynamic> injectDefaultPlaylistsInUserPlaylists(dynamic res) async => res;
  dynamic noSuchMethod(Invocation invocation) => null;
}

class _StubUserChannel {
  const _StubUserChannel();
  Future<YoutiPieUserChannelsResult?> fetchUserChannels({dynamic details}) async => null;
  Future<YoutiPieUserChannelsAllVideosResult?> fetchUserChannelsAllVideos({dynamic details}) async => null;
  dynamic noSuchMethod(Invocation invocation) => null;
}

class _StubComment {
  const _StubComment();
  Future<YoutiPieCommentResult?> fetchComments({dynamic videoId, dynamic continuationToken, dynamic details}) async => null;
  Future<YoutiPieCommentReplyResult?> fetchCommentReplies({dynamic mainComment, dynamic details}) async => null;
  Future<YoutiPieCommentResult?> fetchNotificationComments({dynamic videoId, dynamic linkedCommentId, dynamic details}) async => null;
  dynamic noSuchMethod(Invocation invocation) => null;
}

class _StubCommentAction {
  const _StubCommentAction();
  Future<bool> changeLikeStatus({dynamic comment, dynamic mainList, dynamic action}) async => true;
  Future<dynamic> createComment({dynamic videoId, dynamic content, dynamic mainList, dynamic commentsList, dynamic videoPage, dynamic createCommentParams}) async => null;
  Future<dynamic> editComment({dynamic videoId, dynamic comment, dynamic content, dynamic mainList, dynamic commentsList, dynamic videoPage}) async => null;
  Future<bool> deleteComment({dynamic videoId, dynamic comment, dynamic mainList, dynamic commentsList, dynamic videoPage}) async => true;
  Future<dynamic> createReply({dynamic mainList, dynamic createReplyParams, dynamic content, dynamic mainComment, dynamic commentsList, dynamic videoPage, dynamic videoId}) async => null;
  Future<dynamic> editReply({dynamic mainList, dynamic reply, dynamic content, dynamic videoId}) async => null;
  Future<bool> deleteReply({dynamic reply, dynamic mainList, dynamic mainComment, dynamic commentsList, dynamic videoPage}) async => true;
  dynamic noSuchMethod(Invocation invocation) => null;
}

class _StubNotificationsAction {
  const _StubNotificationsAction();
  Future<bool> markNotficationRead({dynamic mainList, dynamic notification}) async => true;
  Future<bool> applyMenuAction({dynamic mainList, dynamic notification, dynamic action}) async => true;
  dynamic noSuchMethod(Invocation invocation) => null;
}

class _StubFeedbackAction {
  const _StubFeedbackAction();
  Future<YoutiPieFeedbackUndo?> sendFeedback({dynamic list, dynamic item, dynamic action}) async => null;
  Future<bool> undoFeedback(dynamic undo) async => true;
  dynamic noSuchMethod(Invocation invocation) => null;
}

class _StubFeed {
  const _StubFeed();
  Future<YoutiPieFeedResult?> fetchFeed({dynamic details}) async => null;
  Future<YoutiPieNotificationResult?> fetchNotifications({dynamic details, dynamic useNewExtractor}) async => null;
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
  Future<YoutiPieVideoPageResult?> fetchVideoPage({dynamic videoId, dynamic relatedVideosParams, dynamic details}) async => null;
  Future<YoutiPieRelatedVideosResult?> fetchRelatedVideos({dynamic videoId, dynamic userPersonalized, dynamic preferMix, dynamic relatedVideosParams, dynamic details}) async => null;
  Future<VideoStreamsResult?> fetchVideoStreams({dynamic id, dynamic details, dynamic client}) async => null;
  Future<HlsMasterPlaylist?> fetchHlsMasterPlaylist(dynamic url) async => null;
  Future<File?> fetchMusicVideoThumbnailToFile({dynamic id, dynamic filePath}) async => null;
  dynamic noSuchMethod(Invocation invocation) => null;
}
