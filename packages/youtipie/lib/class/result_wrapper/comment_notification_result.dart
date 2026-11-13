class YoutiPieNotificationCommentResult {
  final dynamic linkedReply;
  final String? linkedMainCommentId;
  final List<dynamic> items;

  int get length => items.length;

  const YoutiPieNotificationCommentResult({
    this.linkedReply,
    this.linkedMainCommentId,
    this.items = const [],
  });

  void transferLocalItemsTo(dynamic other) {}

  dynamic noSuchMethod(Invocation invocation) => null;
}

typedef CommentNotificationResult = YoutiPieNotificationCommentResult;
