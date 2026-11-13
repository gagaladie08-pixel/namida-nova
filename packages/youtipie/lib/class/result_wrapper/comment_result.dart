import 'package:youtipie/class/comments/comment_info_item.dart';
import 'package:youtipie/class/result_wrapper/list_wrapper_base.dart';

class YoutiPieCommentResult extends YoutiPieListWrapper<CommentInfoItem> {
  @override
  final List<CommentInfoItem> items;
  const YoutiPieCommentResult({this.items = const []});

  dynamic noSuchMethod(Invocation invocation) => null;
}

typedef CommentResult = YoutiPieCommentResult;
