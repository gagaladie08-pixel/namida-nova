import 'dart:async';
import 'dart:math' as math;
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

extension EqualizerBandTypeProperties on EqualizerBandType {
  bool get hasGain => this == EqualizerBandType.peak || this == EqualizerBandType.lowShelf || this == EqualizerBandType.highShelf;
  bool get hasOrder => this == EqualizerBandType.lowPass || this == EqualizerBandType.highPass;
}

enum EqualizerChannel {
  all,
  left,
  right,
}

enum PlayerConfigModificationScale {
  main,
  alt,
  none,
}

class EqualizerBand {
  static const double kMinFrequency = 20.0;
  static const double kMaxFrequency = 20000.0;
  static const double kMinGain = -24.0;
  static const double kMaxGain = 24.0;
  static const double kMinQ = 0.1;
  static const double kMaxQ = 10.0;
  static const double kDefaultQ = 1.0;
  static const List<int> kOrders = [1, 2, 4, 6, 8];

  final int id;
  final EqualizerBandType type;
  final double frequency;
  final double gain;
  final double q;
  final int order;
  final EqualizerChannel channel;
  final bool enabled;

  const EqualizerBand({
    required this.id,
    this.type = EqualizerBandType.peak,
    this.frequency = 1000.0,
    this.gain = 0.0,
    this.q = kDefaultQ,
    this.order = 2,
    this.channel = EqualizerChannel.all,
    this.enabled = true,
  });

  EqualizerBand copyWith({
    int? id,
    EqualizerBandType? type,
    double? frequency,
    double? gain,
    double? q,
    int? order,
    EqualizerChannel? channel,
    bool? enabled,
  }) => EqualizerBand(
    id: id ?? this.id,
    type: type ?? this.type,
    frequency: frequency ?? this.frequency,
    gain: gain ?? this.gain,
    q: q ?? this.q,
    order: order ?? this.order,
    channel: channel ?? this.channel,
    enabled: enabled ?? this.enabled,
  );

  factory EqualizerBand.fromMap(Map<dynamic, dynamic> map) => EqualizerBand(
    id: (map['id'] as num?)?.toInt() ?? 0,
    type: EqualizerBandType.values.firstWhere((e) => e.name == map['type'], orElse: () => EqualizerBandType.peak),
    frequency: (map['frequency'] as num?)?.toDouble() ?? 1000.0,
    gain: (map['gain'] as num?)?.toDouble() ?? 0.0,
    q: (map['q'] as num?)?.toDouble() ?? kDefaultQ,
    order: (map['order'] as num?)?.toInt() ?? 2,
    channel: EqualizerChannel.values.firstWhere((e) => e.name == map['channel'], orElse: () => EqualizerChannel.all),
    enabled: map['enabled'] as bool? ?? true,
  );

  Map<String, dynamic> toMap() => {
    'id': id,
    'type': type.name,
    'frequency': frequency,
    'gain': gain,
    'q': q,
    'order': order,
    'channel': channel.name,
    'enabled': enabled,
  };

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is EqualizerBand &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          type == other.type &&
          frequency == other.frequency &&
          gain == other.gain &&
          q == other.q &&
          order == other.order &&
          channel == other.channel &&
          enabled == other.enabled;

  @override
  int get hashCode => Object.hash(id, type, frequency, gain, q, order, channel, enabled);
}

class ParametricEqualizer {
  static const double kMinPreamp = -20.0;
  static const double kMaxPreamp = 20.0;
  static const ParametricEqualizer flat = ParametricEqualizer(bands: []);

  static const List<double> graphic5Frequencies = [60.0, 230.0, 910.0, 3600.0, 14000.0];
  static const List<double> graphic10Frequencies = [31.0, 62.0, 125.0, 250.0, 500.0, 1000.0, 2000.0, 4000.0, 8000.0, 16000.0];
  static const List<double> graphic15Frequencies = [25.0, 40.0, 63.0, 100.0, 160.0, 250.0, 400.0, 630.0, 1000.0, 1600.0, 2500.0, 4000.0, 6300.0, 10000.0, 16000.0];
  static const List<double> graphic31Frequencies = [20.0, 25.0, 31.5, 40.0, 50.0, 63.0, 80.0, 100.0, 125.0, 160.0, 200.0, 250.0, 315.0, 400.0, 500.0, 630.0, 800.0, 1000.0, 1250.0, 1600.0, 2000.0, 2500.0, 3150.0, 4000.0, 5000.0, 6300.0, 8000.0, 10000.0, 12500.0, 16000.0, 20000.0];

  final List<EqualizerBand> bands;
  final double preamp;
  final bool autoPreamp;
  final bool limiter;

  const ParametricEqualizer({
    this.bands = const [],
    this.preamp = 0.0,
    this.autoPreamp = true,
    this.limiter = false,
  });

  static List<double> logFrequencies(double min, double max, int count) {
    if (count <= 1) return [min];
    final logMin = math.log(min);
    final logMax = math.log(max);
    final step = (logMax - logMin) / (count - 1);
    return List.generate(count, (i) => math.exp(logMin + step * i));
  }

  static ParametricEqualizer graphic(List<double> frequencies) => ParametricEqualizer(
    bands: [
      for (int i = 0; i < frequencies.length; i++)
        EqualizerBand(id: i, frequency: frequencies[i], gain: 0.0),
    ],
  );

  static ParametricEqualizer fromLegacyGains(List<double> gains) {
    final freqs = graphic5Frequencies;
    final bands = <EqualizerBand>[];
    for (int i = 0; i < gains.length && i < freqs.length; i++) {
      bands.add(EqualizerBand(id: i, frequency: freqs[i], gain: gains[i]));
    }
    return ParametricEqualizer(bands: bands);
  }

  double computeEffectivePreamp() {
    if (!autoPreamp) return preamp;
    double maxBoost = 0.0;
    for (final b in bands) {
      if (b.enabled && b.gain > maxBoost) maxBoost = b.gain;
    }
    return -maxBoost;
  }

  List<EqualizerBand> getActiveBands() => bands.where((b) => b.enabled && (b.gain != 0.0 || !b.type.hasGain)).toList();

  int getNextBandId() => bands.isEmpty ? 0 : (bands.map((b) => b.id).reduce(math.max) + 1);

  bool get hasChannelSpecificBands => bands.any((b) => b.channel != EqualizerChannel.all);

  List<double> responseCurve(List<double> frequencies, {EqualizerChannel channel = EqualizerChannel.all}) =>
      frequencies.map((f) => responseDb(f, channel: channel)).toList();

  ParametricEqualizer withBand(EqualizerBand band) {
    final updated = List<EqualizerBand>.from(bands);
    final idx = updated.indexWhere((b) => b.id == band.id);
    if (idx != -1) {
      updated[idx] = band;
    } else {
      updated.add(band);
    }
    return copyWith(bands: updated);
  }

  ParametricEqualizer withoutBand(int id) => copyWith(bands: bands.where((b) => b.id != id).toList());

  ParametricEqualizer copyWith({
    List<EqualizerBand>? bands,
    double? preamp,
    bool? autoPreamp,
    bool? limiter,
  }) => ParametricEqualizer(
    bands: bands ?? this.bands,
    preamp: preamp ?? this.preamp,
    autoPreamp: autoPreamp ?? this.autoPreamp,
    limiter: limiter ?? this.limiter,
  );

  double responseDb(double freq, {EqualizerChannel channel = EqualizerChannel.all}) {
    double totalDb = 0.0;
    for (final band in bands) {
      if (!band.enabled) continue;
      if (band.channel != EqualizerChannel.all && channel != EqualizerChannel.all && band.channel != channel) continue;
      totalDb += _biquadResponseDb(band, freq);
    }
    return totalDb;
  }

  static double _biquadResponseDb(EqualizerBand band, double f) {
    if (band.type == EqualizerBandType.peak) {
      final ratio = f / band.frequency;
      final diff = ratio - 1.0 / ratio;
      final q = band.q;
      final denom = 1.0 + (q * diff) * (q * diff);
      return band.gain / denom;
    } else if (band.type == EqualizerBandType.lowShelf) {
      if (f <= band.frequency) return band.gain;
      final ratio = f / band.frequency;
      return band.gain / (1.0 + math.pow(ratio, 2 * band.q));
    } else if (band.type == EqualizerBandType.highShelf) {
      if (f >= band.frequency) return band.gain;
      final ratio = band.frequency / f;
      return band.gain / (1.0 + math.pow(ratio, 2 * band.q));
    } else if (band.type == EqualizerBandType.highPass) {
      final ratio = band.frequency / f;
      return -10.0 * math.log(1.0 + math.pow(ratio, 2 * band.order)) / math.ln10;
    } else if (band.type == EqualizerBandType.lowPass) {
      final ratio = f / band.frequency;
      return -10.0 * math.log(1.0 + math.pow(ratio, 2 * band.order)) / math.ln10;
    }
    return 0.0;
  }

  static ParametricEqualizer? fromEqualizerApo(String text) {
    final lines = text.split('\n');
    double preamp = 0.0;
    bool hasFilters = false;
    final bands = <EqualizerBand>[];
    EqualizerChannel currentChannel = EqualizerChannel.all;

    for (var line in lines) {
      line = line.trim();
      if (line.isEmpty) continue;
      if (line.startsWith('Preamp:')) {
        final match = RegExp(r'Preamp:\s*([+-]?\d+(?:\.\d+)?)\s*dB').firstMatch(line);
        if (match != null) {
          preamp = double.tryParse(match.group(1)!) ?? 0.0;
        }
      } else if (line.startsWith('Channel:')) {
        final ch = line.substring(8).trim().toUpperCase();
        if (ch == 'L') {
          currentChannel = EqualizerChannel.left;
        } else if (ch == 'R') {
          currentChannel = EqualizerChannel.right;
        } else {
          currentChannel = EqualizerChannel.all;
        }
      } else if (line.startsWith('Filter')) {
        hasFilters = true;
        final enabled = !line.contains('OFF');
        EqualizerBandType type = EqualizerBandType.peak;
        if (line.contains('PK')) type = EqualizerBandType.peak;
        else if (line.contains('LSC')) type = EqualizerBandType.lowShelf;
        else if (line.contains('HSC')) type = EqualizerBandType.highShelf;
        else if (line.contains('LP')) type = EqualizerBandType.lowPass;
        else if (line.contains('HP')) type = EqualizerBandType.highPass;

        final fcMatch = RegExp(r'Fc\s*(\d+(?:\.\d+)?)\s*Hz').firstMatch(line);
        final freq = fcMatch != null ? double.tryParse(fcMatch.group(1)!) ?? 1000.0 : 1000.0;

        final gainMatch = RegExp(r'Gain\s*([+-]?\d+(?:\.\d+)?)\s*dB').firstMatch(line);
        final gain = gainMatch != null ? double.tryParse(gainMatch.group(1)!) ?? 0.0 : 0.0;

        double q = EqualizerBand.kDefaultQ;
        final qMatch = RegExp(r'Q\s*(\d+(?:\.\d+)?)').firstMatch(line);
        if (qMatch != null) {
          q = double.tryParse(qMatch.group(1)!) ?? EqualizerBand.kDefaultQ;
        } else {
          final bwMatch = RegExp(r'BW\s*Oct\s*(\d+(?:\.\d+)?)').firstMatch(line);
          if (bwMatch != null) {
            final bw = double.tryParse(bwMatch.group(1)!) ?? 1.0;
            final p = math.pow(2, bw);
            final p2 = math.pow(2, bw / 2);
            q = (p2 / (p - 1)).toDouble();
          }
        }

        bands.add(EqualizerBand(
          id: bands.length,
          type: type,
          frequency: freq,
          gain: gain,
          q: q,
          channel: currentChannel,
          enabled: enabled,
        ));
      }
    }
    if (!hasFilters) return null;
    return ParametricEqualizer(bands: bands, preamp: preamp, autoPreamp: false);
  }

  String toEqualizerApo() {
    final buffer = StringBuffer();
    buffer.writeln('Preamp: $preamp dB');
    EqualizerChannel lastChannel = EqualizerChannel.all;
    for (int i = 0; i < bands.length; i++) {
      final b = bands[i];
      if (b.channel != lastChannel) {
        lastChannel = b.channel;
        if (lastChannel == EqualizerChannel.left) buffer.writeln('Channel: L');
        else if (lastChannel == EqualizerChannel.right) buffer.writeln('Channel: R');
        else buffer.writeln('Channel: all');
      }
      final onOff = b.enabled ? 'ON' : 'OFF';
      final typeStr = switch (b.type) {
        EqualizerBandType.peak => 'PK',
        EqualizerBandType.lowShelf => 'LSC',
        EqualizerBandType.highShelf => 'HSC',
        EqualizerBandType.lowPass => 'LP',
        EqualizerBandType.highPass => 'HP',
        _ => 'PK',
      };
      buffer.write('Filter ${i + 1}: $onOff $typeStr Fc ${b.frequency} Hz');
      if (b.type.hasGain) buffer.write(' Gain ${b.gain} dB');
      buffer.writeln(' Q ${b.q}');
    }
    return buffer.toString();
  }

  factory ParametricEqualizer.fromMap(Map<dynamic, dynamic> map) {
    final bandsList = (map['bands'] as List<dynamic>?)
            ?.map((e) => EqualizerBand.fromMap(e as Map<dynamic, dynamic>))
            .toList() ??
        const [];
    return ParametricEqualizer(
      bands: bandsList,
      preamp: (map['preamp'] as num?)?.toDouble() ?? 0.0,
      autoPreamp: map['autoPreamp'] as bool? ?? true,
      limiter: map['limiter'] as bool? ?? false,
    );
  }

  Map<String, dynamic> toMap() => {
    'bands': bands.map((b) => b.toMap()).toList(),
    'preamp': preamp,
    'autoPreamp': autoPreamp,
    'limiter': limiter,
  };
}

class EqualizerPreset {
  final String name;
  final ParametricEqualizer equalizer;

  const EqualizerPreset({required this.name, required this.equalizer});

  EqualizerPreset copyWith({String? name, ParametricEqualizer? equalizer}) => EqualizerPreset(
    name: name ?? this.name,
    equalizer: equalizer ?? this.equalizer,
  );

  static EqualizerPreset? fromMap(Map<dynamic, dynamic> map) {
    final name = map['name'] as String?;
    if (name == null) return null;
    if (map['gains'] is List) {
      final gains = (map['gains'] as List).map((e) => (e as num).toDouble()).toList();
      return EqualizerPreset(name: name, equalizer: ParametricEqualizer.fromLegacyGains(gains));
    }
    if (map['equalizer'] is Map) {
      return EqualizerPreset(name: name, equalizer: ParametricEqualizer.fromMap(map['equalizer'] as Map));
    }
    return EqualizerPreset(name: name, equalizer: ParametricEqualizer.flat);
  }

  Map<String, dynamic> toMap() => {
    'name': name,
    'equalizer': equalizer.toMap(),
  };

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is EqualizerPreset &&
          runtimeType == other.runtimeType &&
          name == other.name;

  @override
  int get hashCode => name.hashCode;
}

class LoudnessEnhancerExtended {
  static const double kMinGain = -20.0;
  static const double kMaxGain = 20.0;

  void setTargetGainUser(double gain) {}
  void setEnabledUser(bool enabled) {}
  void setTargetGainTrack(double gain) {}

  dynamic noSuchMethod(Invocation invocation) => null;
}

class PlayerConfig {
  final bool skipSilence;
  final bool loudnessEnhancerEnabled;
  final double loudnessEnhancer;
  final bool equalizerEnabled;
  final ParametricEqualizer equalizer;
  final EqualizerPreset? preset;
  final double speed;
  final double volume;
  final double pitch;

  const PlayerConfig({
    this.skipSilence = false,
    this.loudnessEnhancerEnabled = false,
    this.loudnessEnhancer = 0.0,
    this.equalizerEnabled = false,
    this.equalizer = ParametricEqualizer.flat,
    this.preset,
    this.speed = 1.0,
    this.volume = 1.0,
    this.pitch = 1.0,
  });

  static bool get isSkipSilenceSupported => true;
  static bool get isEqualizerSupported => true;
  static bool get isLoudnessEnhancerSupported => true;

  factory PlayerConfig.fromMap(Map<dynamic, dynamic> map) => const PlayerConfig();
  Map<String, dynamic> toMap() => {};

  PlayerConfig copyWith({
    bool? skipSilence,
    bool? loudnessEnhancerEnabled,
    double? loudnessEnhancer,
    bool? equalizerEnabled,
    ParametricEqualizer? equalizer,
    EqualizerPreset? preset,
    double? speed,
    double? volume,
    double? pitch,
  }) => PlayerConfig(
    skipSilence: skipSilence ?? this.skipSilence,
    loudnessEnhancerEnabled: loudnessEnhancerEnabled ?? this.loudnessEnhancerEnabled,
    loudnessEnhancer: loudnessEnhancer ?? this.loudnessEnhancer,
    equalizerEnabled: equalizerEnabled ?? this.equalizerEnabled,
    equalizer: equalizer ?? this.equalizer,
    preset: preset ?? this.preset,
    speed: speed ?? this.speed,
    volume: volume ?? this.volume,
    pitch: pitch ?? this.pitch,
  );
}

class PlayerConfigOverrides {
  static const none = PlayerConfigOverrides();

  final double? pitch;
  final double? speed;
  final double? volume;
  final double? balance;
  final bool? skipSilence;
  final bool? loudnessEnhancerEnabled;
  final double? loudnessEnhancer;
  final bool? equalizerEnabled;

  const PlayerConfigOverrides({
    this.pitch,
    this.speed,
    this.volume,
    this.balance,
    this.skipSilence,
    this.loudnessEnhancerEnabled,
    this.loudnessEnhancer,
    this.equalizerEnabled,
  });

  factory PlayerConfigOverrides.fromMap(Map<dynamic, dynamic> map) {
    return PlayerConfigOverrides(
      pitch: (map['pitch'] as num?)?.toDouble(),
      speed: (map['speed'] as num?)?.toDouble(),
      volume: (map['volume'] as num?)?.toDouble(),
      balance: (map['balance'] as num?)?.toDouble(),
      skipSilence: map['skipSilence'] as bool?,
      loudnessEnhancerEnabled: map['loudnessEnhancerEnabled'] as bool?,
      loudnessEnhancer: (map['loudnessEnhancer'] as num?)?.toDouble(),
      equalizerEnabled: map['equalizerEnabled'] as bool?,
    );
  }

  Map<String, dynamic> toMap() => {
    'pitch': pitch,
    'speed': speed,
    'volume': volume,
    'balance': balance,
    'skipSilence': skipSilence,
    'loudnessEnhancerEnabled': loudnessEnhancerEnabled,
    'loudnessEnhancer': loudnessEnhancer,
    'equalizerEnabled': equalizerEnabled,
  };

  PlayerConfigOverrides copyWith({
    double? pitch,
    double? speed,
    double? volume,
    double? balance,
    bool? skipSilence,
    bool? loudnessEnhancerEnabled,
    double? loudnessEnhancer,
    bool? equalizerEnabled,
  }) {
    return PlayerConfigOverrides(
      pitch: pitch ?? this.pitch,
      speed: speed ?? this.speed,
      volume: volume ?? this.volume,
      balance: balance ?? this.balance,
      skipSilence: skipSilence ?? this.skipSilence,
      loudnessEnhancerEnabled: loudnessEnhancerEnabled ?? this.loudnessEnhancerEnabled,
      loudnessEnhancer: loudnessEnhancer ?? this.loudnessEnhancer,
      equalizerEnabled: equalizerEnabled ?? this.equalizerEnabled,
    );
  }

  PlayerConfigOverrides copyWithEqualizer(ParametricEqualizer? equalizer, EqualizerPreset? preset) => this;

  PlayerConfigOverrides clear({
    bool? volume,
    bool? speed,
    bool? pitch,
    bool? loudnessEnhancer,
    bool? equalizer,
    bool? skipSilence,
  }) => PlayerConfigOverrides(
    pitch: (pitch == true) ? null : this.pitch,
    speed: (speed == true) ? null : this.speed,
    volume: (volume == true) ? null : this.volume,
    balance: balance,
    skipSilence: (skipSilence == true) ? null : this.skipSilence,
    loudnessEnhancerEnabled: (loudnessEnhancer == true) ? null : loudnessEnhancerEnabled,
    loudnessEnhancer: (loudnessEnhancer == true) ? null : this.loudnessEnhancer,
    equalizerEnabled: (equalizer == true) ? null : this.equalizerEnabled,
  );

  PlayerConfig resolve(PlayerConfig defaultConfig) => defaultConfig.copyWith(
    pitch: pitch,
    speed: speed,
    volume: volume,
    skipSilence: skipSilence,
    loudnessEnhancerEnabled: loudnessEnhancerEnabled,
    loudnessEnhancer: loudnessEnhancer,
    equalizerEnabled: equalizerEnabled,
  );

  PlayerConfigModificationScale getModificationScale() => PlayerConfigModificationScale.none;
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
  final numberOfRepeats = Rx<int>(0);

  PlayerRepeatMode get displayRepeatMode => PlayerRepeatMode.none;
  PlayerRepeatMode get playerRepeatMode => PlayerRepeatMode.none;
  void updateNumberOfRepeats(int n) {}
  PlayerRepeatMode userCycleRepeatMode() => PlayerRepeatMode.none;

  AudioLoadConfiguration? get defaultAndroidLoadConfig => null;

  LoudnessEnhancerExtended? get loudnessEnhancerExtended => null;

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
