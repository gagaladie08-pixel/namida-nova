import 'package:flutter/foundation.dart';
import 'package:nampack/nampack.dart';
import 'package:playlist_manager/module/playlist_id.dart';
import 'package:playlist_manager/playlist_manager.dart';

class FavouritePlaylist<T, E, S> extends Rx<GeneralPlaylist<T, S>> {
  FavouritePlaylist(super.value);

  PlaylistID? get playlistID => value.playlistID;

  bool isItemFavourite(dynamic item) => false;

  bool isSubItemFavourite(dynamic item) => false;

  ({T item, int index})? firstItemForSubItem(dynamic item) {
    final index = value.tracks.indexWhere((e) => e == item);
    if (index < 0) return null;
    return (item: value.tracks[index], index: index);
  }
}
