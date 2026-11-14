class RelatedVideosRequestParams {
  final dynamic id;
  final dynamic name;
  final dynamic title;
  const RelatedVideosRequestParams({this.id, this.name, this.title});
  const RelatedVideosRequestParams.allowAll({this.id, this.name, this.title});

  dynamic noSuchMethod(Invocation invocation) => null;
}
