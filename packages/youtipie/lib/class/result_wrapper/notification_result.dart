import 'package:youtipie/class/stream_info_item/stream_info_item_notification.dart';
import 'package:youtipie/class/result_wrapper/list_wrapper_base.dart';

class YoutiPieNotificationResult extends YoutiPieListWrapper<StreamInfoItemNotification> {
  @override
  final List<StreamInfoItemNotification> items;

  const YoutiPieNotificationResult({this.items = const []});

  dynamic noSuchMethod(Invocation invocation) => null;
}

typedef NotificationResult = YoutiPieNotificationResult;
