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
  fetchChannelTab,
  fetchNotifications,
  changeVideoLikeStatus,
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

extension YoutiPieOperationExtension on YoutiPieOperation {
  bool get requiresAccount => false;
}
