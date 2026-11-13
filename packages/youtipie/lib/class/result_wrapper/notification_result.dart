class YoutiPieNotificationResult {
  final List<dynamic> items;

  const YoutiPieNotificationResult({this.items = const []});

  dynamic noSuchMethod(Invocation invocation) => null;
}

typedef NotificationResult = YoutiPieNotificationResult;
