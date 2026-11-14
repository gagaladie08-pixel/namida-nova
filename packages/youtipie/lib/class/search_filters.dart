enum YoutiPieSearchMatchMode {
  phrase,
  title,
}

class YoutiPieSearchDate {
  final DateTime? date;
  const YoutiPieSearchDate([this.date]);

  static YoutiPieSearchDate? parse(String text) {
    if (text.isEmpty) return null;
    final dt = DateTime.tryParse(text);
    if (dt == null) return null;
    return YoutiPieSearchDate(dt);
  }

  static YoutiPieSearchDate fromDateTime(DateTime dt) => YoutiPieSearchDate(dt);

  DateTime toDateTime() => date ?? DateTime.now();
  DateTime toDateTimeUtc() => date?.toUtc() ?? DateTime.now().toUtc();

  @override
  String toString() => date != null
      ? "${date!.year.toString().padLeft(4, '0')}-${date!.month.toString().padLeft(2, '0')}-${date!.day.toString().padLeft(2, '0')}"
      : '';
}

class YoutiPieSearchParsedDates {
  final YoutiPieSearchDate? after;
  final YoutiPieSearchDate? before;
  const YoutiPieSearchParsedDates({this.after, this.before});
}

class YoutiPieSearchFilters {
  static const defaults = YoutiPieSearchFilters();

  final YoutiPieSearchDate? after;
  final YoutiPieSearchDate? before;
  final bool isDefault;

  const YoutiPieSearchFilters({
    this.after,
    this.before,
    this.isDefault = true,
  });

  static YoutiPieSearchParsedDates? parseDateOperators(String text) => null;
  static String stripDateOperators(String text) => text;

  dynamic noSuchMethod(Invocation invocation) => null;
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
