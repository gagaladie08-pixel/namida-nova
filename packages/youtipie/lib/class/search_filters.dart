import 'package:youtipie/core/enum.dart';

export 'package:youtipie/core/enum.dart';

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

  final YoutiPieSearchType type;
  final YoutiPieSearchSort sort;
  final YoutiPieSearchUploadDate uploadDate;
  final YoutiPieSearchDate? after;
  final YoutiPieSearchDate? before;

  const YoutiPieSearchFilters({
    this.type = YoutiPieSearchType.all,
    this.sort = YoutiPieSearchSort.relevance,
    this.uploadDate = YoutiPieSearchUploadDate.none,
    this.after,
    this.before,
  });

  bool get hasDateRange => after != null || before != null;

  bool get isDefault =>
      type == YoutiPieSearchType.all &&
      sort == YoutiPieSearchSort.relevance &&
      uploadDate == YoutiPieSearchUploadDate.none &&
      !hasDateRange;

  YoutiPieSearchFilters copyWith({
    YoutiPieSearchType? type,
    YoutiPieSearchSort? sort,
    YoutiPieSearchUploadDate? uploadDate,
    YoutiPieSearchDate? after,
    YoutiPieSearchDate? before,
    bool clearAfter = false,
    bool clearBefore = false,
  }) {
    return YoutiPieSearchFilters(
      type: type ?? this.type,
      sort: sort ?? this.sort,
      uploadDate: uploadDate ?? this.uploadDate,
      after: clearAfter ? null : (after ?? this.after),
      before: clearBefore ? null : (before ?? this.before),
    );
  }

  static YoutiPieSearchParsedDates? parseDateOperators(String text) => null;
  static String stripDateOperators(String text) => text;

  dynamic noSuchMethod(Invocation invocation) => null;
}

class YoutiPieSearchOperators {
  final List<String> phrases;
  final List<String> titlePhrases;
  final List<String> excluded;
  final String remainingText;
  final YoutiPieSearchMatchMode? matchMode;

  const YoutiPieSearchOperators({
    this.phrases = const [],
    this.titlePhrases = const [],
    this.excluded = const [],
    this.remainingText = '',
    this.matchMode,
  });

  static YoutiPieSearchOperators parse(String text) => const YoutiPieSearchOperators();

  static String buildQuery(String text, {YoutiPieSearchMatchMode? matchMode, List<String> excluded = const []}) => text;

  dynamic noSuchMethod(Invocation invocation) => null;
}

class SearchFilters {
  final dynamic id;
  final dynamic name;
  final dynamic title;
  const SearchFilters({this.id, this.name, this.title});

  dynamic noSuchMethod(Invocation invocation) => null;
}
