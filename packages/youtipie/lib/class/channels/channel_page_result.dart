import 'package:youtipie/youtipie.dart';

class YoutiPieChannelPageResult {
  final dynamic id;
  final dynamic name;
  final String? title;
  final List<Thumbnail> thumbnails;
  final dynamic subscribersCountText;
  final int? subscribersCount;
  final bool? subscribed;

  const YoutiPieChannelPageResult({
    this.id,
    this.name,
    this.title,
    this.thumbnails = const [],
    this.subscribersCountText,
    this.subscribersCount,
    this.subscribed,
  });

  dynamic noSuchMethod(Invocation invocation) => null;
}

typedef ChannelPageResult = YoutiPieChannelPageResult;
