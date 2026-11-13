class StreamInfoItemNotification {
  final String? linkedCommentId;
  final String? notificationId;
  final String id;

  const StreamInfoItemNotification({
    this.linkedCommentId,
    this.notificationId,
    this.id = '',
  });

  dynamic noSuchMethod(Invocation invocation) => null;
}
