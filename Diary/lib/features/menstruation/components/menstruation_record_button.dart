import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pilll/features/error/error_alert.dart';
import 'package:pilll/utils/analytics.dart';
import 'package:pilll/components/atoms/button.dart';
import 'package:pilll/features/menstruation_edit/menstruation_edit_page.dart';
import 'package:pilll/features/menstruation/menstruation_select_modify_type_sheet.dart';
import 'package:pilll/entity/menstruation.codegen.dart';
import 'package:pilll/entity/setting.codegen.dart';
import 'package:pilll/provider/menstruation.dart';
import 'package:pilll/utils/datetime/day.dart';

class MenstruationRecordButton extends HookConsumerWidget {
  final Menstruation? latestMenstruation;
  final Setting setting;
  final Function(Menstruation) onRecord;

  const MenstruationRecordButton({
    Key? key,
    required this.latestMenstruation,
    required this.setting,
    required this.onRecord,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final beginMenstruation = ref.watch(beginMenstruationProvider);
    return SizedBox(
      width: 180,
      child: PrimaryButton(
        onPressed: () async {
          analytics.logEvent(name: "pressed_menstruation_record");

          final latestMenstruation = this.latestMenstruation;
          if (latestMenstruation != null && latestMenstruation.dateRange.inRange(today())) {
            return showMenstruationEditPage(context, initialMenstruation: latestMenstruation);
          }
          if (setting.durationMenstruation == 0) {
            return showMenstruationEditPage(context, initialMenstruation: null);
          }
          showModalBottomSheet(
            context: context,
            builder: (_) => MenstruationSelectModifyTypeSheet(onTap: (type) async {
              switch (type) {
                case MenstruationSelectModifyType.today:
                  analytics.logEvent(name: "tapped_menstruation_record_today");
                  final navigator = Navigator.of(context);
                  try {
                    final created = await beginMenstruation(today(), setting: setting);
                    onRecord(created);
                    navigator.pop();
                    return;
                  } catch (error) {
                    showErrorAlert(context, error);
                  }
                  return;
                case MenstruationSelectModifyType.yesterday:
                  analytics.logEvent(name: "tapped_menstruation_record_yesterday");
                  final navigator = Navigator.of(context);
                  try {
                    final created = await beginMenstruation(yesterday(), setting: setting);
                    onRecord(created);
                    navigator.pop();
                  } catch (error) {
                    showErrorAlert(context, error);
                  }
                  return;
                case MenstruationSelectModifyType.begin:
                  analytics.logEvent(name: "tapped_menstruation_record_begin");
                  Navigator.of(context).pop();
                  return showMenstruationEditPage(context, initialMenstruation: null);
              }
            }),
          );
        },
        text: _buttonString,
      ),
    );
  }

  String get _buttonString {
    final latestMenstruation = this.latestMenstruation;
    if (latestMenstruation == null) {
      return "生理を記録";
    }
    if (latestMenstruation.dateRange.inRange(today())) {
      return "生理期間を編集";
    }
    return "生理を記録";
  }
}
