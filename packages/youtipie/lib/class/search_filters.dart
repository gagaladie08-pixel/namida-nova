class YoutiPieSearchDate {
  final DateTime? date;
  const YoutiPieSearchDate([this.date]);
}

class YoutiPieSearchParsedDates {
  final YoutiPieSearchDate? after;
  final YoutiPieSearchDate? before;
  const YoutiPieSearchParsedDates({this.after, this.before});
}

class YoutiPieSearchFilters {
  static YoutiPieSearchParsedDates? parseDateOperators(String text) => null;
  static String stripDateOperators(String text) => text;
}

class YoutiPieSearchOperators {
  static dynamic parse(String text) => null;
}

class SearchFilters {
  final dynamic id;
  final dynamic name;
  final dynamic title;
  const SearchFilters({this.id, this.name, this.title});

  dynamic noSuchMethod(Invocation invocation) => null;
}
