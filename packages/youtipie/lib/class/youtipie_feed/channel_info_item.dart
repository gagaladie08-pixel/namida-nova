class ChannelInfoItem {
  final dynamic id;
  final dynamic name;
  final dynamic title;
  final dynamic handler;
  final List<dynamic> thumbnails;

  const ChannelInfoItem({this.id, this.name, this.title, this.handler, this.thumbnails = const []});
  const ChannelInfoItem.anonymous() : id = '', name = '', title = '', handler = '', thumbnails = const [];

  dynamic noSuchMethod(Invocation invocation) => null;
}
