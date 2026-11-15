enum LikeStatus {
  liked,
  disliked,
  undefined,
  unknown,
}

enum LikeAction {
  addLike,
  removeLike,
  addDislike,
  removeDislike,
}

extension LikeActionExtension on LikeAction {
  LikeStatus toExpectedStatus() {
    return switch (this) {
      LikeAction.addLike => LikeStatus.liked,
      LikeAction.removeLike => LikeStatus.undefined,
      LikeAction.addDislike => LikeStatus.disliked,
      LikeAction.removeDislike => LikeStatus.undefined,
    };
  }
}

enum ChannelNotifications {
  all,
  personalized,
  none,
}

enum PlaylistPrivacy {
  public,
  unlisted,
  private,
}

enum FeedbackMenuActionType {
  notInterested,
  dontRecommendChannel,
}

enum VideoEndScreenItemType {
  video,
  playlist,
  channel,
  unknown,
}

enum CommentsSortType {
  top,
  newest,
}

enum YoutiLoginProgress {
  canceled,
  failed,
  success,
  working,
}

enum AccountCookiesValidity {
  valid,
  invalid,
  expired,
}

enum YoutiPieOperation {
  fetchHashtag,
  fetchFeed,
  fetchUserChannels,
  fetchHistory,
  fetchUserPlaylists,
  fetchUserPlaylistsNext,
  fetchUserPlaylistsSort,
  fetchChannelTab,
  fetchNotifications,
  fetchNotificationsNext,
  fetchUserChannelsNext,
  fetchUserChannelsSort,
  fetchUserChannelsAllVideos,
  fetchUserChannelsAllVideosNext,
  getPlaylistsForVideo,
  getPlaylistEditInfo,
  addRemoveVideosPlaylist,
  createPlaylist,
  sendVoteReturnYoutubeDislike,
  markNotificationRead,
  fetchNotificationComments,
  fetchNotificationCommentsNext,
  sendFeedback,
  undoFeedback,
  changeVideoLikeStatus,
  addVideoToHistory,
  fetchMusicBrowse,
  other,
}

enum YoutiPieFetchAllResType {
  success,
  fail,
  alreadyCanceled,
  alreadyDone,
  inProgress,
}

enum YoutiPieSearchType {
  all,
  video,
  channel,
  playlist,
  movie,
}

enum YoutiPieSearchSort {
  relevance,
  rating,
  date,
  views,
}

enum YoutiPieSearchUploadDate {
  none,
  lastHour,
  today,
  thisWeek,
  thisMonth,
  thisYear,
}

enum YoutiPieSearchMatchMode {
  phrase,
  title,
}

enum YoutiPieMusicSearchType {
  songs,
  videos,
  albums,
  artists,
  playlists,
  profiles,
  episodes,
  podcasts,
}

enum InnertubeClients {
  web,
  android,
  ios,
  tv_samsung,
  tv_lg,
}

class InnertubeClientConfiguration {
  final bool requireJSPlayer;
  const InnertubeClientConfiguration({this.requireJSPlayer = false});
}

extension InnertubeClientsConfiguration on InnertubeClients {
  InnertubeClientConfiguration get configuration => const InnertubeClientConfiguration();
}

extension YoutiPieOperationExtension on YoutiPieOperation {
  bool get requiresAccount => false;
}
