import 'package:youtipie/class/map_serializable.dart';
import 'package:youtipie/core/enum.dart';

export 'package:youtipie/core/enum.dart';

class YoutiPieFetchAllRes {
  final Future<YoutiPieFetchAllResType> result;
  void cancel() {}
  const YoutiPieFetchAllRes({required this.result});

  dynamic noSuchMethod(Invocation invocation) => null;
}

abstract class YoutiPieListWrapper<T> {
  List<T> get items;
  int get length => items.length;
  bool get isEmpty => items.isEmpty;
  bool get isNotEmpty => items.isNotEmpty;
  T operator [](int index) => items[index];
  bool get canFetchNext => false;
  Future<bool> fetchNext() async => false;
  void transferLocalItemsTo(dynamic other) {}

  YoutiPieFetchAllRes? fetchAll({void Function()? onProgress, dynamic details}) =>
      YoutiPieFetchAllRes(result: Future.value(YoutiPieFetchAllResType.success));
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
