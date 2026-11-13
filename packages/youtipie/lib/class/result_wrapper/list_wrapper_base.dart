import 'package:youtipie/class/map_serializable.dart';

abstract class YoutiPieListWrapper<T> {
  List<T> get items;
  int get length => items.length;
  bool get canFetchNext => false;
  Future<bool> fetchNext() async => false;
  void transferLocalItemsTo(dynamic other) {}
}

class ListWrapperBase extends YoutiPieListWrapper<MapSerializable> {
  @override
  final List<MapSerializable> items;
  final dynamic id;
  final dynamic name;
  final dynamic title;
  const ListWrapperBase({this.id, this.name, this.title, this.items = const []});

  dynamic noSuchMethod(Invocation invocation) => null;
}
