import 'package:youtipie/class/youtipie_feed/yt_feed_base.dart';

class StreamInfoItem extends YoutubeFeed {
  @override
  final String id;
  @override
  final dynamic title;
  final String? shortDescription;
  final dynamic channel;
  final String? thumbnailGifUrl;
  final String? publishedFromText;
  final dynamic publishedAt;
  final int? indexInPlaylist;
  final int? durSeconds;
  final String? durText;
  final dynamic viewsText;
  final dynamic viewsCount;
  final dynamic percentageWatched;
  final List<dynamic> liveThumbs;
  final dynamic isUploaderVerified;
  final dynamic badges;
  final bool? isActuallyShortContent;
  final bool? isUploadedByMe;
  final String? channelId;
  final String? channelName;
  final List<dynamic> thumbnails;

  const StreamInfoItem({
    this.id = '',
    this.title = '',
    this.shortDescription,
    this.channel,
    this.thumbnailGifUrl,
    this.publishedFromText,
    this.publishedAt,
    this.indexInPlaylist,
    this.durSeconds,
    this.durText,
    this.viewsText,
    this.viewsCount,
    this.percentageWatched,
    this.liveThumbs = const [],
    this.isUploaderVerified,
    this.badges,
    this.isActuallyShortContent,
    this.isUploadedByMe,
    this.channelId,
    this.channelName,
    this.thumbnails = const [],
    super.items = const [],
  });

  static StreamInfoItem fromMap(dynamic map) => const StreamInfoItem();
  Map<String, dynamic> toMap() => {};

  dynamic noSuchMethod(Invocation invocation) => null;
}
