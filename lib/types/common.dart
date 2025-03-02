import 'package:daily_mind/common_applications/gapless_audio_player.dart';
import 'package:daily_mind/common_domains/audio_category.dart';
import 'package:daily_mind/db/schemas/settings.dart';
import 'package:flutter/material.dart';

typedef OfflineAudioSources = Map<String, List<String>>;

// typedef OnItemVolumeChanged = Function(
//   OfflineMixEditorItemState offlineMixEditorItemState,
//   double volume,
// );

typedef OnWidgetSettingBuilder = Widget Function(Settings?);

typedef OnEmptyWidgetBuilder<T> = Widget Function(T data);

typedef OnListItemBuilder<T> = Widget Function(
  BuildContext context,
  List<T>,
);

typedef OnItemBuilder<T> = Widget Function(
  BuildContext context,
  T item,
);

typedef OnItemIndexBuilder<T> = Widget Function(
  BuildContext context,
  int index,
  T item,
);

typedef OnSoundOfflineStateBuilder = Function(
  GaplessAudioPlayer gaplessAudioPlayer,
  bool isLoading,
  bool isPlaying,
);

typedef OnOnlineHandlerBuilder = Widget Function(VoidCallback onTap);

typedef AudioCategoryGroup = Map<String, List<AudioCategory>>;

typedef OnCounting = Function(int remainingSeconds);

typedef OnAudioSelected = Function(dynamic audio, String audioFrom);
