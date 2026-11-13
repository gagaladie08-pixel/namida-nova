enum NotificationMenuActionType {
  hide,
  mute,
  other,
}

class NotificationMenuAction {
  final String text;
  final String? iconType;
  final NotificationMenuActionType type;

  const NotificationMenuAction({
    this.text = '',
    this.iconType,
    this.type = NotificationMenuActionType.hide,
  });

  dynamic noSuchMethod(Invocation invocation) => null;
}
