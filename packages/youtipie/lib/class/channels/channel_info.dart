import 'package:youtipie/class/map_serializable.dart';

class YoutiPieChannelInfo extends MapSerializable {
  @override
  final dynamic id;
  @override
  final dynamic name;
  @override
  final dynamic title;
  final List<dynamic> thumbnails;
  final List<dynamic> banners;
  final List<dynamic> tvbanners;
  final List<dynamic> mobileBanners;

  const YoutiPieChannelInfo({
    this.id,
    this.name,
    this.title,
    this.thumbnails = const [],
    this.banners = const [],
    this.tvbanners = const [],
    this.mobileBanners = const [],
  });

  dynamic noSuchMethod(Invocation invocation) => null;
}

typedef ChannelInfo = YoutiPieChannelInfo;
