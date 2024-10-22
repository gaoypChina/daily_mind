import 'package:daily_mind/common_applications/safe_builder.dart';
import 'package:daily_mind/common_widgets/base_task_form/presentation/base_task_form.dart';
import 'package:daily_mind/db/db.dart';
import 'package:daily_mind/db/schemas/task.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:reactive_forms/reactive_forms.dart';

class FocusModeEdit extends HookWidget {
  final Task task;
  final ValueChanged<Task> onAfterUpdated;

  const FocusModeEdit({
    super.key,
    required this.task,
    required this.onAfterUpdated,
  });

  @override
  Widget build(BuildContext context) {
    final onEditTask = useCallback(
      (FormGroup formGroup) async {
        final value = formGroup.value;
        final title = value['title'] as String;
        final workingSessions = value['workingSessions'] as int;
        final shortBreak = value['shortBreak'] as int;
        final longBreak = value['longBreak'] as int;

        task.title = title;
        task.workingSessions = workingSessions;
        task.shortBreak = shortBreak;
        task.longBreak = longBreak;

        final id = await db.onUpdateTask(task);
        final updatedTask = db.onGetTask(id);

        if (context.mounted) {
          onSafeValueBuilder(updatedTask, onAfterUpdated);
          context.pop();
        }
      },
      [task],
    );

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: BaseTaskForm(
        title: 'Cập nhật nhiệm vụ'.tr(),
        buttonTitle: 'Cập nhật'.tr(),
        onPressed: onEditTask,
        onUpdateValue: (formGroup) {
          formGroup.updateValue({
            'workingSessions': task.workingSessions,
            'title': task.title,
            'shortBreak': task.shortBreak,
            'longBreak': task.longBreak,
          });
        },
      ),
    );
  }
}
