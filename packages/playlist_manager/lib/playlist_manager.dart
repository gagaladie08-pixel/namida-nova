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

mixin PlaylistItemWithDate {
  int get dateAdded;
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

  static List<String> normalizeTags(List<String> tags) {
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
  DateTime creationDate;
  int modifiedDate;
  String? m3uPath;
  PlaylistID? playlistID;
  List<String> tags;
  List<String> moods;
  bool isPinned;
  String comment;
  int? artworkDate;
  Map<String, dynamic> metadata;
  bool isReadOnly;
  dynamic remoteSource;
  dynamic sortsType;
  bool sortReverse;

  GeneralPlaylist({
    required this.name,
    List<T>? tracks,
    DateTime? creationDate,
    int? modifiedDate,
    this.m3uPath,
    this.playlistID,
    List<String>? tags,
    List<String>? moods,
    this.isPinned = false,
    this.comment = '',
    this.artworkDate,
    Map<String, dynamic>? metadata,
    this.isReadOnly = false,
    this.remoteSource,
    this.sortsType,
    this.sortReverse = false,
  })  : tracks = tracks ?? [],
        creationDate = creationDate ?? DateTime.now(),
        modifiedDate = modifiedDate ?? DateTime.now().millisecondsSinceEpoch,
        tags = tags ?? [],
        moods = moods ?? [],
        metadata = metadata ?? {};

  String toTagsAndMoodsText() {
    final all = [...tags, ...moods];
    return all.join(', ');
  }

  GeneralPlaylist<T, S> get value => this;

  int? get pinnedDate => isPinned ? modifiedDate : null;
}

extension RxMapLengthExt<K, V> on Rx<Map<K, V>> {
  int get length => value.length;
}

abstract class PlaylistManager<T, I, S> {
  final playlists = RxList<GeneralPlaylist<T, S>>();
  final playlistsMap = Rx<Map<String, GeneralPlaylist<T, S>>>({});
  late final FavouritePlaylist<T, I, S> favouritesPlaylist = FavouritePlaylist<T, I, S>(
    GeneralPlaylist<T, S>(name: 'Favourites'),
  );

  RegExp get cleanupFilenameRegex => RegExp(r'');

  I identifyBy(T item);

  File getArtworkFileForPlaylist(String playlistName) => File('');
  dynamic get tagsFilter => null;
  final canReorderItems = Rx<bool>(false);
  Rx<List<String>> getCustomIndicesOrderListRx() => Rx<List<String>>([]);
  bool isOneOfDefaultPlaylists(String name) => false;
  void reorderTrack(dynamic playlist, int oldIndex, int newIndex) {}
  void updatePropertyInPlaylist(
    String name, {
    dynamic itemsSortReverse,
    dynamic sortsType,
    dynamic tags,
    dynamic moods,
    dynamic isPinned,
    dynamic comment,
  }) {}
  void resetCanReorder() {}
  void onPlaylistReorder(int oldIndex, int newIndex) {}
  Future<void> removeTracksFromPlaylist(GeneralPlaylist<T, S> playlist, dynamic indexes) async {}
  void ensureCustomOrderValid({bool removeNonExistent = true}) {}

  Future<void> get waitForPlaylistsLoad async {}
  Future<void> get waitForFavouritePlaylistLoad async {}

  GeneralPlaylist<T, S>? getPlaylist(String name) {
    return playlists.firstWhereOrNull((p) => p.name == name);
  }

  bool isFavourite(I item) => favouritesPlaylist.isSubItemFavourite(item);

  bool favouriteButtonOnPressed(I item, {bool refreshNotification = true}) {
    return false;
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

  Future<bool> writePlaylistToStorage(GeneralPlaylist<T, S> playlist) async => true;

  Future<void> removePlaylist(GeneralPlaylist<T, S> playlist) async {}

  Future<void> removePlaylists(List<String> names, {bool deleteM3UFiles = false}) async {}

  Future<int> importTracksToPlaylist(GeneralPlaylist<T, S> playlist, Iterable<T> tracks) async {
    playlist.tracks.addAll(tracks);
    return tracks.length;
  }

  void addNewPlaylist(String name, {dynamic videoIds}) {}

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
  }) async => null;

  void addTracksToPlaylist(dynamic playlist, dynamic tracks) {}
}
