class YoutiPieCommentReplyResult {
  final String? commentId;
  final String? cacheKey;
  final List<dynamic> items;
  final dynamic continuation;

  int get length => items.length;

  const YoutiPieCommentReplyResult({
    this.commentId,
    this.cacheKey,
    this.items = const [],
    this.continuation,
  });

  dynamic noSuchMethod(Invocation invocation) => null;
}

typedef CommentReplyResult = YoutiPieCommentReplyResult;
