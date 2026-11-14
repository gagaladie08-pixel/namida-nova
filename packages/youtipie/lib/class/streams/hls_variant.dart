class HlsVariant {
  final int height;
  final int bandwidth;
  final dynamic id;
  final dynamic name;
  final dynamic title;

  const HlsVariant({
    this.height = 0,
    this.bandwidth = 0,
    this.id,
    this.name,
    this.title,
  });

  dynamic noSuchMethod(Invocation invocation) => null;
}

class HlsMasterPlaylist {
  final List<HlsVariant> variants;

  const HlsMasterPlaylist({this.variants = const []});

  String buildSingleVariantMaster(HlsVariant variant) => '';

  dynamic noSuchMethod(Invocation invocation) => null;
}
