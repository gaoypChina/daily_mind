import 'package:daily_mind/common_providers/base_audio_handler_provider.dart';
import 'package:daily_mind/features/focus_mode_session/constant/focus_mode_session.dart';
import 'package:daily_mind/features/focus_mode_session/domain/task_data.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

TaskBackgroundData useBackgroundTaskData(WidgetRef ref) {
  final baseBackgroundHandler = ref.watch(baseBackgroundHandlerProvider);
  final taskTitle = baseBackgroundHandler.taskTitle;
  final taskCurrentSession = baseBackgroundHandler.taskCurrentSession;
  final taskWorkingSessions = baseBackgroundHandler.taskWorkingSessions;

  final taskRemainingSecondsSnapshot =
      useStream(baseBackgroundHandler.onStreamTaskRemainingSeconds);
  final taskSecondsSnapshot =
      useStream(baseBackgroundHandler.onStreamTaskSeconds);
  final taskCurrentStepSnapshot =
      useStream(baseBackgroundHandler.onStreamTaskCurrentStep);
  final taskPlayingSnapshot =
      useStream(baseBackgroundHandler.onStreamTaskPlaying);

  final taskSeconds = taskSecondsSnapshot.data ?? 0;
  final taskRemainingSeconds = taskRemainingSecondsSnapshot.data ?? 0;
  final taskCurrentStep =
      taskCurrentStepSnapshot.data ?? FocusModeSessionSteps.ready;
  final taskIsPlaying = taskPlayingSnapshot.data ?? false;

  return TaskBackgroundData(
    taskTitle: taskTitle,
    taskSeconds: taskSeconds,
    taskRemainingSeconds: taskRemainingSeconds,
    taskCurrentStep: taskCurrentStep,
    taskCurrentSession: taskCurrentSession,
    taskWorkingSessions: taskWorkingSessions,
    taskIsPlaying: taskIsPlaying,
  );
}
