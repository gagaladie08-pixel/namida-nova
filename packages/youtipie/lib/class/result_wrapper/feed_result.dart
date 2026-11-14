import 'package:youtipie/class/feedback_menu_action.dart';
import 'package:youtipie/class/youtipie_feed/yt_feed_base.dart';
import 'package:youtipie/class/result_wrapper/list_wrapper_base.dart';
import 'package:youtipie/class/result_wrapper/feedback_holder.dart';

class YoutiPieFeedResult extends YoutiPieListWrapper<YoutubeFeed> implements YoutiPieFeedbackHolder {
  @override
  final List<YoutubeFeed> items;
  final dynamic shortsSection;
  @override
  final Map<String, List<FeedbackMenuAction>> feedbackActions;

  const YoutiPieFeedResult({
    this.items = const [],
    this.shortsSection,
    this.feedbackActions = const {},
  });

  dynamic noSuchMethod(Invocation invocation) => null;
}

typedef FeedResult = YoutiPieFeedResult;
