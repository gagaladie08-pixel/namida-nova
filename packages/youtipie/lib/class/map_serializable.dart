class MapSerializable {
  static const dummyKey = 'dummy';
  static const timestampKey = 'timestamp';

  final dynamic id;
  final dynamic name;
  final dynamic title;
  const MapSerializable({this.id, this.name, this.title});

  String get cacheKey => (id ?? name ?? title ?? '').toString();

  dynamic noSuchMethod(Invocation invocation) => null;
}
