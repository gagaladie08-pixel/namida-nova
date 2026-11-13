class CommentInfoItem {
  final String? commentId;
  final int repliesCount;

  const CommentInfoItem({
    this.commentId,
    this.repliesCount = 0,
  });

  dynamic noSuchMethod(Invocation invocation) => null;
}
