import 'dart:async';
import 'package:audio_service/audio_service.dart';
import 'package:flutter/foundation.dart';
import 'package:nampack/nampack.dart';

enum PlayerRepeatMode {
  none,
  one,
  all,
  allShuffle,
  forNtimes,
}

enum InterruptionType {
  shouldPause,
  shouldDuck,
  unknown,
}

enum InterruptionAction {
  doNothing,
  duckAudio,
  pause,
}

enum EqualizerBandType {
  peak,
  lowShelf,
  highShelf,
  lowPass,
  highPass,
  bandPass,
  notch,
  allPass,
}

enum EqualizerChannel {
  all,
  left,
  right,
}

class PlayerConfigOverrides {
  static const none = PlayerConfigOverrides();

  final double? pitch;
  final double? speed;
  final double? volume;
  final double? balance;

  const PlayerConfigOverrides({
    this.pitch,
    this.speed,
    this.volume,
    this.balance,
  });

  factory PlayerConfigOverrides.fromMap(Map<dynamic, dynamic> map) {
    return PlayerConfigOverrides(
      pitch: (map['pitch'] as num?)?.toDouble(),
      speed: (map['speed'] as num?)?.toDouble(),
      volume: (map['volume'] as num?)?.toDouble(),
      balance: (map['balance'] as num?)?.toDouble(),
    );
  }

  Map<String, dynamic> toMap() => {
    'pitch': pitch,
    'speed': speed,
    'volume': volume,
    'balance': balance,
  };

  PlayerConfigOverrides copyWith({
    double? pitch,
    double? speed,
    double? volume,
    double? balance,
  }) {
    return PlayerConfigOverrides(
      pitch: pitch ?? this.pitch,
      speed: speed ?? this.speed,
      volume: volume ?? this.volume,
      balance: balance ?? this.balance,
    );
  }
}

class AndroidLoadControl {
  final Duration minBufferDuration;
  final Duration maxBufferDuration;
  final Duration bufferForPlaybackAfterRebufferDuration;
  final bool prioritizeTimeOverSizeThresholds;

  const AndroidLoadControl({
    this.minBufferDuration = const Duration(seconds: 5),
    this.maxBufferDuration = const Duration(minutes: 3),
    this.bufferForPlaybackAfterRebufferDuration = const Duration(seconds: 5),
    this.prioritizeTimeOverSizeThresholds = true,
  });
}

class AudioLoadConfiguration {
  final AndroidLoadControl? androidLoadControl;

  const AudioLoadConfiguration({this.androidLoadControl});
}

class QueueShuffler<Q> {
  List<Q> shuffle(List<Q> items) => List<Q>.from(items)..shuffle();
}

abstract class BasicAudioHandler<Q> extends BaseAudioHandler {
  final playWhenReady = ValueNotifier<bool>(false);
  final queueShuffler = QueueShuffler<Q>();
  final queueItems = RxList<Q>();

  AudioLoadConfiguration? get defaultAndroidLoadConfig => null;

  bool getLoudnessEnhancerEnabledTrackValue() => false;
  bool getLoudnessEnhancerEnabledTrackValueR() => false;

  Future<void> onQueueChanged() async {}
  void onReorderItems(int currentIndex, Q itemDragged) {}
  Future<void> clearQueue() async {
    queueItems.clear();
  }
  Future<void>? beforeSkippingToItem() => null;
  Future<void> assignNewQueue(dynamic items, {dynamic initialIndex, dynamic initialPosition}) async {}
  Future<void> setVideo(dynamic videoOptions) async {}
  Future<void> onPauseRaw() async {}
  Future<void> onPlaybackCompleted() async {}
  Future<void> setSkipSilenceEnabled(bool enabled) async {}
  Future<void> seekToLiveEdge() async {}
  Future<void> onDispose() async {}

  Future<void> skipToNext({bool andPlay = true, bool isManualSkip = false}) async {}
  Future<void> skipToPrevious({bool isManualSkip = false}) async {}
}
