import 'dart:async';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/foundation.dart';
import 'package:nampack/nampack.dart';
import 'package:playlist_manager/class/favourite_playlist.dart';
import 'package:playlist_manager/module/playlist_id.dart';

export 'package:playlist_manager/class/favourite_playlist.dart';
export 'package:playlist_manager/core/enum.dart';
export 'package:playlist_manager/module/playlist_id.dart';

sealed class PlaylistTagKey {}

enum PlaylistVirtualTag implements PlaylistTagKey {
  pinned,
  untagged,
  m3u,
  remote;
}

class PlaylistUserTag implements PlaylistTagKey {
  final String path;
  const PlaylistUserTag(this.path);
}

class PlaylistTagsSelection {
  final List<PlaylistTagKey> included;
  final List<PlaylistTagKey> excluded;
  const PlaylistTagsSelection({
    this.included = const [],
    this.excluded = const [],
  });
}

enum PlaylistTagFilterState {
  none,
  included,
  excluded,
}

class PlaylistTagChip {
  final PlaylistTagKey key;
  final PlaylistTagFilterState state;
  final int depth;
  final String? label;
  final int? color;
  final int count;

  const PlaylistTagChip({
    required this.key,
    this.state = PlaylistTagFilterState.none,
    this.depth = 0,
    this.label,
    this.color,
    this.count = 0,
  });
}

class PlaylistTagInfo {
  final String path;
  final String name;
  final int count;
  final dynamic color;
  final List<PlaylistTagInfo> nested;

  const PlaylistTagInfo({
    this.path = '',
    this.name = '',
    this.count = 0,
    this.color,
    this.nested = const [],
  });

  dynamic noSuchMethod(Invocation invocation) => null;
}

mixin PlaylistItemWithDate {
  int get dateAdded;
}

class PlaylistRemoteSource {
  final String? sourceKey;
  final String? remoteId;
  const PlaylistRemoteSource({this.sourceKey, this.remoteId});
  static const none = PlaylistRemoteSource();
}

class PlaylistMetadataEdit {
  final List<String>? tags;
  final List<String>? moods;
  final bool? isPinned;
  final String? comment;
  final int? artworkDate;
  final int? modifiedDate;

  const PlaylistMetadataEdit({
    this.tags,
    this.moods,
    this.isPinned,
    this.comment,
    this.artworkDate,
    this.modifiedDate,
  });
}

class PlaylistTagsFilter {
  static const String separator = '/';

  static List<String> normalizeTags(Iterable<String> tags) {
    return tags.map((t) => t.trim().toLowerCase()).where((t) => t.isNotEmpty).toSet().toList();
  }

  static List<String> expandTags(List<String> tags) {
    final result = <String>{};
    for (final tag in tags) {
      final parts = tag.split(separator);
      var current = '';
      for (final part in parts) {
        if (current.isEmpty) {
          current = part;
        } else {
          current = '$current$separator$part';
        }
        result.add(current);
      }
    }
    return result.toList();
  }

  List<int> colorsOf(dynamic tags) => const [];
}

class PlaylistTagSection {
  final dynamic key;
  final int? color;
  final List<String> names;

  const PlaylistTagSection({
    required this.key,
    this.color,
    this.names = const [],
  });

  dynamic noSuchMethod(Invocation invocation) => null;
}

class GeneralPlaylist<T, S> {
  String name;
  List<T> tracks;
  int creationDate;
  int modifiedDate;
  String? m3uPath;
  PlaylistID? playlistID;
  List<String> tags;
  List<String> moods;
  bool isPinned;
  int? pinnedDate;
  String comment;
  int? artworkDate;
  Map<String, dynamic> metadata;
  bool isReadOnly;
  dynamic remoteSource;
  dynamic sortsType;
  bool sortReverse;
  bool isFav;
  dynamic customOrder;

  GeneralPlaylist({
    required this.name,
    List<T>? tracks,
    int? creationDate,
    int? modifiedDate,
    this.m3uPath,
    this.playlistID,
    List<String>? tags,
    List<String>? moods,
    this.isPinned = false,
    this.pinnedDate,
    this.comment = '',
    this.artworkDate,
    Map<String, dynamic>? metadata,
    this.isReadOnly = false,
    this.remoteSource,
    this.sortsType,
    this.sortReverse = false,
    this.isFav = false,
    this.customOrder,
  })  : tracks = tracks ?? [],
        creationDate = creationDate ?? DateTime.now().millisecondsSinceEpoch,
        modifiedDate = modifiedDate ?? DateTime.now().millisecondsSinceEpoch,
        tags = tags ?? [],
        moods = moods ?? [],
        metadata = metadata ?? {};

  String toTagsAndMoodsText() {
    final all = [...tags, ...moods];
    return all.join(', ');
  }

  GeneralPlaylist<T, S> get value => this;

  Map<String, dynamic> toJson(
    dynamic Function(T item) itemToJson,
    dynamic sortToJson, {
    bool includeTracks = true,
  }) => {
    'name': name,
    'creationDate': creationDate,
    'modifiedDate': modifiedDate,
    if (includeTracks) 'tracks': tracks.map(itemToJson).toList(),
  };

  GeneralPlaylist<T, S> copyWith({
    String? name,
    List<T>? tracks,
    int? creationDate,
    int? modifiedDate,
    String? m3uPath,
    bool? isPinned,
    int? pinnedDate,
    String? comment,
    List<String>? moods,
    List<String>? tags,
    dynamic remoteSource,
  }) => GeneralPlaylist<T, S>(
    name: name ?? this.name,
    tracks: tracks ?? this.tracks,
    creationDate: creationDate ?? this.creationDate,
    modifiedDate: modifiedDate ?? this.modifiedDate,
    m3uPath: m3uPath ?? this.m3uPath,
    isPinned: isPinned ?? this.isPinned,
    pinnedDate: pinnedDate ?? this.pinnedDate,
    comment: comment ?? this.comment,
    moods: moods ?? this.moods,
    tags: tags ?? this.tags,
    remoteSource: remoteSource ?? this.remoteSource,
  );

  GeneralPlaylist<T, S> copyWithConvertedTracks(T Function(T item) converter) => copyWith(tracks: tracks.map(converter).toList());

  static GeneralPlaylist<T, S> fromJson<T, S>(
    dynamic json,
    dynamic itemFromJson,
    dynamic sortFromJson,
  ) {
    final map = json is Map ? json : const <String, dynamic>{};
    final name = map['name']?.toString() ?? '';
    return GeneralPlaylist<T, S>(name: name);
  }
}

extension PlaylistEntriesExt<T, S> on List<MapEntry<String, GeneralPlaylist<T, S>>> {
  void movePinnedFirst() {
    sort((a, b) {
      if (a.value.isPinned == b.value.isPinned) return 0;
      return a.value.isPinned ? -1 : 1;
    });
  }
}

extension RxMapLengthExt<K, V> on Rx<Map<K, V>> {
  int get length => value.length;
}

abstract class PlaylistManager<T extends PlaylistItemWithDate, I, S> {
  final playlists = RxList<GeneralPlaylist<T, S>>([]);
  final playlistsMap = RxMap<String, GeneralPlaylist<T, S>>({});
  late final FavouritePlaylist<T, I, S> favouritesPlaylist = FavouritePlaylist<T, I, S>(
    GeneralPlaylist<T, S>(name: 'Favourites'),
  );

  RegExp get cleanupFilenameRegex => RegExp(r'');

  I identifyBy(T item);

  File getArtworkFileForPlaylist(String playlistName) => File('');
  dynamic get tagsFilter => null;
  final canReorderItems = Rx<bool>(false);
  final customIndicesOrderRx = Rx<List<String>?>(null);
  Rx<List<String>?> getCustomIndicesOrderListRx() => customIndicesOrderRx;
  bool isOneOfDefaultPlaylists(String name) => false;
  void reorderTrack(dynamic playlist, int oldIndex, int newIndex) {}
  Future<void> updatePropertyInPlaylist(
    String name, {
    dynamic itemsSortReverse,
    dynamic sortsType,
    dynamic itemsSortType,
    dynamic restoreCustomOrder,
    dynamic tracks,
    dynamic tracksRaw,
    dynamic convertItem,
    dynamic tracksFromNewSource,
    dynamic creationDate,
    dynamic modifiedDate,
    dynamic m3uPath,
    dynamic remoteSource,
    dynamic isFav,
    dynamic tags,
    dynamic moods,
    dynamic isPinned,
    dynamic comment,
  }) async {
    final playlist = playlistsMap.value[name] ?? getPlaylist(name);
    if (playlist == null) return;
    if (tracks is List<T>) playlist.tracks = tracks;
    if (creationDate is int) playlist.creationDate = creationDate;
    if (modifiedDate is int) playlist.modifiedDate = modifiedDate;
    if (m3uPath is String) playlist.m3uPath = m3uPath;
    if (remoteSource != null) playlist.remoteSource = remoteSource;
    if (isFav is bool) playlist.isFav = isFav;
    if (tags is List<String>) playlist.tags = tags;
    if (moods is List<String>) playlist.moods = moods;
    if (isPinned is bool) playlist.isPinned = isPinned;
    if (comment is String) playlist.comment = comment;
    if (itemsSortType != null) playlist.sortsType = itemsSortType;
    if (itemsSortReverse is bool) playlist.sortReverse = itemsSortReverse;
  }
  void resetCanReorder() {}
  void onPlaylistReorder(int oldIndex, int newIndex) {}
  Future<void> removeTracksFromPlaylist(GeneralPlaylist<T, S> playlist, dynamic indexes) async {}
  void ensureCustomOrderValid({bool removeNonExistent = true}) {}

  Future<void> get waitForPlaylistsLoad async {}
  Future<void> get waitForFavouritePlaylistLoad async {}

  GeneralPlaylist<T, S>? getPlaylist(String name) {
    return playlists.value.firstWhereOrNull((p) => p.name == name);
  }

  bool isFavourite(I item) => favouritesPlaylist.isSubItemFavourite(item);

  bool favouriteButtonOnPressed(I item, {bool refreshNotification = true}) {
    return false;
  }

  bool toggleTrackFavourite(T item) {
    final tracks = favouritesPlaylist.value.tracks;
    final index = tracks.indexWhere((e) => identifyBy(e) == identifyBy(item));
    if (index >= 0) {
      tracks.removeAt(index);
      return false;
    }
    tracks.add(item);
    return true;
  }

  int? getMetadataEditDate(GeneralPlaylist<T, S> playlist) => null;

  Future<bool> setArtworkForPlaylist(
    String playlistName, {
    required File? artworkFile,
    required Uint8List? artworkBytes,
  }) async => true;

  Future<bool> renamePlaylist(String playlistName, String newName) async => true;

  FutureOr<void> onPlaylistTracksChanged(GeneralPlaylist<T, S> playlist) async {}

  Future<void> updatePlaylistsMetadata(Map<String, PlaylistMetadataEdit> edits) async {}

  Future<void> updatePlaylistMetadata(
    String name, {
    bool? isPinned,
    dynamic edit,
    List<String>? tags,
    List<String>? moods,
    String? comment,
    int? artworkDate,
  }) async {}

  Future<void> insertTracksInPlaylistWithEachIndex(dynamic playlist, dynamic tracks) async {}

  Future<void> replaceTheseTracksInPlaylists(bool Function(T item) predicate, T Function(T item) replacer) async {
    for (final playlist in playlistsMap.value.values) {
      playlist.tracks = playlist.tracks.map((item) => predicate(item) ? replacer(item) : item).toList();
    }
  }

  Future<void> replaceTheseTracksInFavourites(bool Function(T item) predicate, T Function(T item) replacer) async {
    final playlist = favouritesPlaylist.value;
    playlist.tracks = playlist.tracks.map((item) => predicate(item) ? replacer(item) : item).toList();
  }

  List<T>? computeCustomOrder(GeneralPlaylist<T, S> playlist) => null;
  Future<GeneralPlaylist<T, S>> ensureNewSourceItemsSorted(GeneralPlaylist<T, S> playlist) async => playlist;
  Future<void> importPlaylistForce(GeneralPlaylist<T, S> playlist, {bool sortPlaylists = true, bool tracksFromNewSource = false}) async {
    playlistsMap.value[playlist.name] = playlist;
  }

  Future<void> removeTag(String tag) async {}

  Future<void> renameTag(String oldTag, String newTag) async {}

  Map<String, int> computeTagsCounts() => {};

  Map<String, int> computeMoodsCounts() => {};

  Future<bool> writePlaylistToStorage(GeneralPlaylist<T, S> playlist) async => true;

  Future<void> removePlaylist(GeneralPlaylist<T, S> playlist) async {}

  Future<void> prepareAllPlaylistsFile() async {}
  Future<void> prepareDefaultPlaylistsFileAsync() async {}

  Future<void> reAddPlaylist(GeneralPlaylist<T, S> playlist, int modifiedDate, {dynamic artworkBytes}) async {
    playlistsMap.value[playlist.name] = playlist;
    playlists.add(playlist);
  }

  Future<void> insertTracksInPlaylist(GeneralPlaylist<T, S> playlist, Iterable<T> tracks, [int? index]) async {
    playlist.tracks.insertAll(index ?? playlist.tracks.length, tracks);
  }

  Future<int> importPlaylistsIfNewer(Iterable<GeneralPlaylist<T, S>> incoming) async {
    var count = 0;
    for (final playlist in incoming) {
      playlistsMap.value[playlist.name] = playlist;
      count++;
    }
    return count;
  }

  Future<void> removePlaylists(List<String> names, {bool deleteM3UFiles = false}) async {}

  Future<int> importTracksToPlaylist(GeneralPlaylist<T, S> playlist, Iterable<T> tracks) async {
    playlist.tracks.addAll(tracks);
    return tracks.length;
  }

  void addNewPlaylist(String name) {}

  String? validatePlaylistName(String? name) => null;

  Future<GeneralPlaylist<T, S>?> addNewPlaylistRaw(
    String name, {
    dynamic videoIds,
    dynamic creationDate,
    dynamic modifiedDate,
    dynamic comment,
    dynamic tracks,
    dynamic convertItem,
    dynamic isPinned,
    dynamic metadata,
    dynamic artworkDate,
    dynamic tags,
    dynamic moods,
    dynamic actionIfAlreadyExists,
    dynamic m3uPath,
  }) async {
    final playlist = GeneralPlaylist<T, S>(
      name: name,
      tracks: const [],
      modifiedDate: modifiedDate is int ? modifiedDate : null,
      comment: comment is String ? comment : '',
      isPinned: isPinned is bool ? isPinned : false,
      m3uPath: m3uPath is String ? m3uPath : null,
    );
    playlists.add(playlist);
    playlistsMap.value[name] = playlist;
    return playlist;
  }

  Future<int?> addTracksToPlaylistRaw<E>(
    GeneralPlaylist<T, S> playlist,
    Iterable<E> tracks,
    dynamic duplicateAction,
    T Function(E item, int dateAdded) convertItem,
  ) async {
    var count = 0;
    final now = DateTime.now().millisecondsSinceEpoch;
    for (final track in tracks) {
      playlist.tracks.add(convertItem(track, now));
      count++;
    }
    return count;
  }

  Future<void> mergeMetadataFrom(String path) async {}

  void addTracksToPlaylist(GeneralPlaylist<T, S> playlist, List<I> tracks) {}
}
