class ChannelTab {
  static const videos = ChannelTab(title: 'Videos');
  static const shorts = ChannelTab(title: 'Shorts');
  static const live = ChannelTab(title: 'Live');
  static const playlists = ChannelTab(title: 'Playlists');
  static const community = ChannelTab(title: 'Community');
  static const about = ChannelTab(title: 'About');
  static const channels = ChannelTab(title: 'Channels');
  static const home = ChannelTab(title: 'Home');

  final String title;
  final bool initiallySelected;
  final dynamic id;
  final dynamic name;

  const ChannelTab({
    this.title = '',
    this.initiallySelected = false,
    this.id,
    this.name,
  });

  bool isVideosTab() => this == videos || title.toLowerCase() == 'videos';

  dynamic noSuchMethod(Invocation invocation) => null;
}
