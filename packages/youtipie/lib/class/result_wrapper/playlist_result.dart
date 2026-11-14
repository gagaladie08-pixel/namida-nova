import 'package:youtipie/class/result_wrapper/list_wrapper_base.dart';
import 'package:youtipie/class/result_wrapper/playlist_result_base.dart';

class YoutiPiePlaylistResult extends YoutiPiePlaylistResultBase implements YoutiPieListWrapper<dynamic> {
  const YoutiPiePlaylistResult({
    super.id,
    super.name,
    super.title,
    super.basicInfo,
    super.items = const [],
  });

  dynamic noSuchMethod(Invocation invocation) => null;
}

typedef PlaylistResult = YoutiPiePlaylistResult;
