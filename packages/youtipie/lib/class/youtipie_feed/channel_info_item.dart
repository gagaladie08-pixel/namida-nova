class ChannelInfoItem {
  final dynamic id;
  final dynamic name;
  final dynamic title;

  const ChannelInfoItem({this.id, this.name, this.title});
  const ChannelInfoItem.anonymous() : id = '', name = '', title = '';

  dynamic noSuchMethod(Invocation invocation) => null;
}
