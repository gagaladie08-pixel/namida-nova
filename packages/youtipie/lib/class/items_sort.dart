class YoutiPieItemsSort {
  final String? title;
  const YoutiPieItemsSort({this.title});

  dynamic noSuchMethod(Invocation invocation) => null;
}

typedef ItemsSort = YoutiPieItemsSort;

mixin YoutiPieListSorterMixin {
  List<YoutiPieItemsSort> get sorts => const [];
}
