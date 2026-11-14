class YoutiPieSearchDate {
  final DateTime? date;
  const YoutiPieSearchDate([this.date]);

  DateTime toDateTimeUtc() => date?.toUtc() ?? DateTime.now().toUtc();
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
  final List<String> phrases;
  final List<String> titlePhrases;
  final List<String> excluded;
  final String remainingText;

  const YoutiPieSearchOperators({
    this.phrases = const [],
    this.titlePhrases = const [],
    this.excluded = const [],
    this.remainingText = '',
  });

  static YoutiPieSearchOperators parse(String text) => const YoutiPieSearchOperators();

  dynamic noSuchMethod(Invocation invocation) => null;
}

class SearchFilters {
  final dynamic id;
  final dynamic name;
  final dynamic title;
  const SearchFilters({this.id, this.name, this.title});

  dynamic noSuchMethod(Invocation invocation) => null;
}
