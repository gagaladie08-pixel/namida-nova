class YoutiPieItemsSort {
  final String title;
  final bool initiallySelected;
  final String? token;

  const YoutiPieItemsSort({
    this.title = '',
    this.initiallySelected = false,
    this.token,
  });

  dynamic noSuchMethod(Invocation invocation) => null;
}

typedef ItemsSort = YoutiPieItemsSort;

mixin YoutiPieListSorterMixin<T> {
  YoutiPieItemsSort? get customSort => null;
  List<YoutiPieItemsSort> get itemsSort => const [];

  Future<bool> fetchWithNewSort({dynamic sort, dynamic details}) async => false;
}
