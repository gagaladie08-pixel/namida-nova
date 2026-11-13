class PlaylistID {
  final String id;

  const PlaylistID({required this.id});

  factory PlaylistID.fromJson(dynamic json) {
    if (json is Map) {
      return PlaylistID(id: json['id'] as String? ?? '');
    }
    return PlaylistID(id: json.toString());
  }

  Map<String, dynamic> toJson() => {'id': id};

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PlaylistID && runtimeType == other.runtimeType && id == other.id;

  @override
  int get hashCode => id.hashCode;

  @override
  String toString() => id;
}
