import 'package:daily_mind/common_applications/base_audio_handler/base_audio_handler.dart';
import 'package:daily_mind/common_widgets/base_player_control/presentation/base_player_actions.dart';
import 'package:daily_mind/common_widgets/base_player_control/presentation/base_player_time.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class BasePlayerControl extends HookWidget {
  final DailyMindBackgroundHandler backgroundHandler;
  final VoidCallback? onNext;
  final VoidCallback? onPrevious;

  const BasePlayerControl({
    super.key,
    required this.backgroundHandler,
    this.onNext,
    this.onPrevious,
  });

  @override
  Widget build(BuildContext context) {
    final player = backgroundHandler.onlinePlayer;
    final duration = player.duration;

    final positionStreamMemoized = useMemoized(() => player.positionStream, []);

    final positionSnapshot = useStream(positionStreamMemoized);

    final playingStreamMemoized = useMemoized(() => player.playingStream, []);

    final playingSnapshot = useStream(playingStreamMemoized);

    final seconds = duration?.inSeconds ?? 0;
    final isPlaying = playingSnapshot.data ?? false;

    return Column(
      children: [
        BasePlayerTime(
          max: seconds,
          onChangeEnd: backgroundHandler.onlinePlayer.seek,
          value: positionSnapshot.data?.inSeconds ?? 0,
        ),
        BasePlayerActions(
          isPlaying: isPlaying,
          onPlay: backgroundHandler.play,
          onPause: backgroundHandler.pause,
          onNext: onNext,
          onPrevious: onPrevious,
        ),
      ],
    );
  }
}
