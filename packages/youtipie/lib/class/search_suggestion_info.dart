class SearchSuggestionInfo {
  final dynamic id;
  final dynamic name;
  final dynamic title;
  final String fullText;
  final (String, String)? typedAndCompletion;
  final String? subtitle;
  final String? displayName;
  final String? entityId;
  final String? thumbnailUrl;
  final bool isChannel;

  const SearchSuggestionInfo({
    this.id,
    this.name,
    this.title,
    this.fullText = '',
    this.typedAndCompletion,
    this.subtitle,
    this.displayName,
    this.entityId,
    this.thumbnailUrl,
    this.isChannel = false,
  });

  dynamic noSuchMethod(Invocation invocation) => null;
}
