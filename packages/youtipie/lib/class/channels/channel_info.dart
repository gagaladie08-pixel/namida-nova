import 'package:youtipie/class/channels/channel_tab.dart';
import 'package:youtipie/class/map_serializable.dart';
import 'package:youtipie/class/youtipie_feed/channel_info_item.dart';

class YoutiPieChannelInfo extends ChannelInfoItem implements MapSerializable {
  final List<dynamic> banners;
  final List<dynamic> tvbanners;
  final List<dynamic> mobileBanners;
  final bool? subscribed;
  final dynamic notifications;
  final dynamic notificationParameters;
  final dynamic channelEngagement;
  final int? subscribersCount;
  final dynamic subscribersCountText;
  final List<ChannelTab> tabs;
  final int? videosCount;
  final String? videosCountText;

  const YoutiPieChannelInfo({
    super.id,
    super.name,
    super.title,
    super.handler,
    super.thumbnails = const [],
    this.banners = const [],
    this.tvbanners = const [],
    this.mobileBanners = const [],
    this.subscribed,
    this.notifications,
    this.notificationParameters,
    this.channelEngagement,
    this.subscribersCount,
    this.subscribersCountText,
    this.tabs = const [],
    this.videosCount,
    this.videosCountText,
  });

  String buildUrl() => '';

  YoutiPieChannelInfo rebuild({
    dynamic newNotifications,
    dynamic newNotificationParameters,
    dynamic newSubscribed,
    dynamic subscribed,
  }) => this;

  dynamic noSuchMethod(Invocation invocation) => null;
}

typedef ChannelInfo = YoutiPieChannelInfo;
