class ChannelInfoItem {
  final dynamic id;
  final dynamic name;
  final dynamic title;
  final dynamic handler;

  const ChannelInfoItem({this.id, this.name, this.title, this.handler});
  const ChannelInfoItem.anonymous() : id = '', name = '', title = '', handler = '';

  dynamic noSuchMethod(Invocation invocation) => null;
}
