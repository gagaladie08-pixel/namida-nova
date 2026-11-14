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
  changeVideoLikeStatus,
  other,
}
