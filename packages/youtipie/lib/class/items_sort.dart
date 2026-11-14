class YoutiPieItemsSort {
  final String? title;
  final bool initiallySelected;

  const YoutiPieItemsSort({
    this.title,
    this.initiallySelected = false,
  });

  dynamic noSuchMethod(Invocation invocation) => null;
}

typedef ItemsSort = YoutiPieItemsSort;

mixin YoutiPieListSorterMixin {
  YoutiPieItemsSort? get customSort => null;
  List<YoutiPieItemsSort> get itemsSort => const [];

  Future<bool> fetchWithNewSort({dynamic sort, dynamic details}) async => false;
}
