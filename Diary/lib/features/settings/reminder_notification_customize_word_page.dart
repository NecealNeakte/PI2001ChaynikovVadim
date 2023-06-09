import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pilll/utils/analytics.dart';
import 'package:pilll/components/atoms/font.dart';
import 'package:pilll/components/atoms/color.dart';
import 'package:pilll/components/atoms/text_color.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pilll/entity/setting.codegen.dart';
import 'package:pilll/features/error/error_alert.dart';
import 'package:pilll/provider/setting.dart';

class ReminderNotificationCustomizeWordPage extends HookConsumerWidget {
  const ReminderNotificationCustomizeWordPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final setSetting = ref.watch(setSettingProvider);
    final setting = ref.watch(settingProvider).requireValue;

    final textFieldControlelr = useTextEditingController(text: setting.reminderNotificationCustomization.word);
    final wordState = useState(setting.reminderNotificationCustomization.word);
    final isInVisibleReminderDate = useState(setting.reminderNotificationCustomization.isInVisibleReminderDate);
    final isInVisiblePillNumber = useState(setting.reminderNotificationCustomization.isInVisiblePillNumber);
    final isInVisibleDescription = useState(setting.reminderNotificationCustomization.isInVisibleDescription);

    return Scaffold(
      backgroundColor: PilllColors.background,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text(
          "服用通知のカスタマイズ",
          style: TextStyle(
            color: TextColor.black,
          ),
        ),
        backgroundColor: PilllColors.background,
      ),
      body: SafeArea(
        child: ListView(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _ReminderPushNotificationPreview(
                    word: wordState.value,
                    isInVisibleReminderDate: isInVisibleReminderDate.value,
                    isInvisiblePillNumber: isInVisiblePillNumber.value,
                    isInvisibleDescription: isInVisibleDescription.value,
                  ),
                  const SizedBox(height: 20),
                  TextField(
                    decoration: InputDecoration(
                      focusedBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(color: PilllColors.secondary),
                      ),
                      counter: Row(children: [
                        const Text(
                          "通知の先頭部分の変更ができます",
                          style: TextStyle(fontFamily: FontFamily.japanese, fontSize: 12, fontWeight: FontWeight.w400, color: TextColor.darkGray),
                        ),
                        const Spacer(),
                        Text(
                          "${wordState.value.characters.length}/8",
                          style:
                              const TextStyle(fontFamily: FontFamily.japanese, fontSize: 12, fontWeight: FontWeight.w400, color: TextColor.darkGray),
                        ),
                      ]),
                    ),
                    autofocus: true,
                    onChanged: (word) {
                      wordState.value = word;
                    },
                    onSubmitted: (word) async {
                      analytics.logEvent(name: "submit_reminder_notification_customize");
                      try {
                        await _reminderNotificationWordSubmit(word: word, setting: setting, setSetting: setSetting);
                        // ignore: use_build_context_synchronously
                        Navigator.of(context).pop();
                      } catch (error) {
                        showErrorAlert(context, error);
                      }
                    },
                    controller: textFieldControlelr,
                    maxLength: 8,
                  ),
                  const SizedBox(height: 20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "詳細設定",
                        style: TextStyle(
                          fontFamily: FontFamily.japanese,
                          fontWeight: FontWeight.w300,
                          fontSize: 14,
                          color: TextColor.primary,
                        ),
                      ),
                      const SizedBox(height: 4),
                      _switchRow(
                        "日付を表示",
                        !isInVisibleReminderDate.value,
                        (value) async {
                          analytics.logEvent(name: "change_reminder_notification_date");
                          try {
                            await _setIsInVisibleReminderDate(isInVisibleReminderDate: !value, setting: setting, setSetting: setSetting);
                            isInVisibleReminderDate.value = !value;
                          } catch (error) {
                            showErrorAlert(context, error);
                          }
                        },
                      ),
                      const Divider(),
                      _switchRow(
                        "番号を表示",
                        !isInVisiblePillNumber.value,
                        (value) async {
                          analytics.logEvent(name: "change_reminder_notification_number");
                          try {
                            await _setIsInVisiblePillNumber(isInVisiblePillNumber: !value, setting: setting, setSetting: setSetting);
                            isInVisiblePillNumber.value = !value;
                          } catch (error) {
                            showErrorAlert(context, error);
                          }
                        },
                      ),
                      const Divider(),
                      _switchRow(
                        "説明文の表示",
                        !isInVisibleDescription.value,
                        (value) async {
                          analytics.logEvent(name: "change_reminder_notification_desc");
                          try {
                            await _setIsInVisibleDescription(isInVisibleDescription: !value, setting: setting, setSetting: setSetting);
                            isInVisibleDescription.value = !value;
                          } catch (error) {
                            showErrorAlert(context, error);
                          }
                        },
                      ),
                      const Divider(),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _switchRow(String title, bool initialValue, ValueChanged<bool> onChanged) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Row(
        children: [
          Text(
            title,
            style: const TextStyle(
              color: TextColor.main,
              fontFamily: FontFamily.japanese,
              fontWeight: FontWeight.w400,
              fontSize: 16,
            ),
          ),
          const Spacer(),
          Switch(
            value: initialValue,
            onChanged: onChanged,
          ),
        ],
      ),
    );
  }

  Future<void> _reminderNotificationWordSubmit({
    required String word,
    required Setting setting,
    required SetSetting setSetting,
  }) async {
    var reminderNotificationCustomization = setting.reminderNotificationCustomization;
    reminderNotificationCustomization = reminderNotificationCustomization.copyWith(word: word);

    setSetting(setting.copyWith(reminderNotificationCustomization: reminderNotificationCustomization));
  }

  Future<void> _setIsInVisibleReminderDate({
    required bool isInVisibleReminderDate,
    required Setting setting,
    required SetSetting setSetting,
  }) async {
    var reminderNotificationCustomization = setting.reminderNotificationCustomization;
    reminderNotificationCustomization = reminderNotificationCustomization.copyWith(isInVisibleReminderDate: isInVisibleReminderDate);

    setSetting(setting.copyWith(reminderNotificationCustomization: reminderNotificationCustomization));
  }

  Future<void> _setIsInVisiblePillNumber({
    required bool isInVisiblePillNumber,
    required Setting setting,
    required SetSetting setSetting,
  }) async {
    var reminderNotificationCustomization = setting.reminderNotificationCustomization;
    reminderNotificationCustomization = reminderNotificationCustomization.copyWith(isInVisiblePillNumber: isInVisiblePillNumber);

    setSetting(setting.copyWith(reminderNotificationCustomization: reminderNotificationCustomization));
  }

  Future<void> _setIsInVisibleDescription({
    required bool isInVisibleDescription,
    required Setting setting,
    required SetSetting setSetting,
  }) async {
    var reminderNotificationCustomization = setting.reminderNotificationCustomization;
    reminderNotificationCustomization = reminderNotificationCustomization.copyWith(isInVisibleDescription: isInVisibleDescription);

    await setSetting(setting.copyWith(reminderNotificationCustomization: reminderNotificationCustomization));
  }
}

extension ReminderNotificationCustomizeWordPageRoutes on ReminderNotificationCustomizeWordPage {
  static Route<dynamic> route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: "ReminderNotificationCustomizeWordPage"),
      builder: (_) => const ReminderNotificationCustomizeWordPage(),
    );
  }
}

class _ReminderPushNotificationPreview extends StatelessWidget {
  final String word;
  final bool isInVisibleReminderDate;
  final bool isInvisiblePillNumber;
  final bool isInvisibleDescription;

  const _ReminderPushNotificationPreview({
    Key? key,
    required this.word,
    required this.isInVisibleReminderDate,
    required this.isInvisiblePillNumber,
    required this.isInvisibleDescription,
  }) : super(key: key);

  // avoid broken editor
  final thinkingFace = "🤔";

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      padding: const EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(children: [
            SvgPicture.asset("images/pilll_icon.svg"),
            const SizedBox(width: 8),
            const Text(
              "Pilll",
              style: TextStyle(
                fontFamily: FontFamily.japanese,
                fontSize: 13,
                fontWeight: FontWeight.w400,
                color: TextColor.lightGray2,
              ),
            ),
          ]),
          const SizedBox(height: 16),
          Text(
            "$word${isInVisibleReminderDate ? "" : " 1/7"}${isInvisiblePillNumber ? "" : " 5番 ~ 8番"}",
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w600,
              fontFamily: FontFamily.japanese,
              color: TextColor.black,
            ),
          ),
          if (!isInvisibleDescription)
            Text(
              "飲み忘れていませんか？\n服用記録がない日が複数あります$thinkingFace",
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                fontFamily: FontFamily.japanese,
                color: TextColor.black,
              ),
            ),
        ],
      ),
    );
  }
}
