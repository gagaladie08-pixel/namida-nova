import 'package:youtipie/youtipie.dart';

class ChannelAboutLink {
  final dynamic id;
  final dynamic name;
  final dynamic title;
  final String link;
  final String linkText;
  final List<Thumbnail> icons;

  const ChannelAboutLink({
    this.id,
    this.name,
    this.title,
    this.link = '',
    this.linkText = '',
    this.icons = const [],
  });

  dynamic noSuchMethod(Invocation invocation) => null;
}
