class PublishTime {
  final DateTime? date;
  final dynamic id;
  final dynamic name;
  final dynamic title;

  const PublishTime({this.date, this.id, this.name, this.title});
  const PublishTime.unknown() : date = null, id = null, name = null, title = null;

  static PublishTime fromMap(dynamic map) => const PublishTime.unknown();

  dynamic noSuchMethod(Invocation invocation) => null;
}
