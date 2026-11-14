import 'package:youtipie/youtipie.dart';

class UserChannelIdentity {
  final bool isOwner;
  final int authUser;
  final bool needsMigration;
  const UserChannelIdentity({this.isOwner = true, this.authUser = 0, this.needsMigration = false});
}

class UserChannelInfo {
  final dynamic id;
  final dynamic name;
  final dynamic title;
  final dynamic handler;
  final List<Thumbnail> thumbnails;
  final UserChannelIdentity identity;

  const UserChannelInfo({
    this.id,
    this.name,
    this.title,
    this.handler,
    this.thumbnails = const [],
    this.identity = const UserChannelIdentity(),
  });

  dynamic noSuchMethod(Invocation invocation) => null;
}
