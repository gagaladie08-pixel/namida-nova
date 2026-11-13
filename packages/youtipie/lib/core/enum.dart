enum LikeStatus {
  liked,
  disliked,
  undefined,
  unknown,
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
  other,
}
