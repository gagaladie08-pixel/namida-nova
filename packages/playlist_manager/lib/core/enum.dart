enum PlaylistAddDuplicateAction {
  justAddEverything,
  addAllAndRemoveOldOnes,
  addOnlyMissing,
  mergeAndSortByAddedDate,
  deleteAndCreateNewPlaylist;

  static const List<PlaylistAddDuplicateAction> valuesForAdd = [
    justAddEverything,
    addAllAndRemoveOldOnes,
    addOnlyMissing,
  ];

  static const List<PlaylistAddDuplicateAction> valuesForAddExcludingAddEverything = [
    addAllAndRemoveOldOnes,
    addOnlyMissing,
  ];
}

enum PlaylistType {
  normal,
  favourite,
  history,
  mostPlayed,
}
