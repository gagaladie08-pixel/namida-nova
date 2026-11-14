import 'package:youtipie/youtipie.dart';

class UserChannelInfo {
  final dynamic id;
  final dynamic name;
  final dynamic title;
  final dynamic handler;
  final List<Thumbnail> thumbnails;

  const UserChannelInfo({
    this.id,
    this.name,
    this.title,
    this.handler,
    this.thumbnails = const [],
  });

  dynamic noSuchMethod(Invocation invocation) => null;
}
