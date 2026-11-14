import 'package:youtipie/class/music/music_chip.dart';
import 'package:youtipie/class/music/music_form_option.dart';
import 'package:youtipie/class/music/music_shelf.dart';
import 'package:youtipie/class/result_wrapper/feedback_holder.dart';
import 'package:youtipie/class/result_wrapper/list_wrapper_base.dart';

class YoutiPieMusicBrowseResult extends YoutiPieListWrapper<YoutiPieMusicShelf> implements YoutiPieFeedbackHolder {
  @override
  final List<YoutiPieMusicShelf> items;
  final String title;
  final String? subtitle;
  final String? channelId;
  final List<dynamic> avatarThumbnails;
  final List<dynamic> bannerThumbnails;
  final List<YoutiPieMusicChip> chips;
  final List<YoutiPieMusicFormOption> formOptions;

  const YoutiPieMusicBrowseResult({
    this.items = const [],
    this.title = '',
    this.subtitle,
    this.channelId,
    this.avatarThumbnails = const [],
    this.bannerThumbnails = const [],
    this.chips = const [],
    this.formOptions = const [],
  });

  String? findSongsPlaylistId() => null;

  dynamic noSuchMethod(Invocation invocation) => null;
}

typedef MusicBrowseResult = YoutiPieMusicBrowseResult;
