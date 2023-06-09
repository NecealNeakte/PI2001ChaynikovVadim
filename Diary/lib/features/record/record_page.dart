import 'package:async_value_group/async_value_group.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:pilll/components/molecules/indicator.dart';
import 'package:pilll/features/record/components/add_pill_sheet_group/add_pill_sheet_group_empty_frame.dart';
import 'package:pilll/features/record/components/button/record_page_button.dart';
import 'package:pilll/features/record/components/announcement_bar/announcement_bar.dart';
import 'package:pilll/features/record/components/supports/record_page_pill_sheet_support_actions.dart';
import 'package:pilll/features/record/components/pill_sheet/record_page_pill_sheet_list.dart';
import 'package:pilll/features/record/components/header/record_page_header.dart';
import 'package:pilll/entity/pill_sheet_group.codegen.dart';
import 'package:pilll/entity/setting.codegen.dart';
import 'package:pilll/features/error/universal_error_page.dart';
import 'package:pilll/components/atoms/color.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pilll/native/widget.dart';
import 'package:pilll/provider/pill_sheet_group.dart';
import 'package:pilll/provider/premium_and_trial.codegen.dart';
import 'package:pilll/provider/root.dart';
import 'package:pilll/provider/setting.dart';
import 'package:pilll/provider/auth.dart';
import 'package:pilll/provider/user.dart';

class RecordPage extends HookConsumerWidget {
  const RecordPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final premiumAndTrial = ref.watch(premiumAndTrialProvider);
    final setting = ref.watch(settingProvider);
    final latestPillSheetGroup = ref.watch(latestPillSheetGroupProvider);
    useAutomaticKeepAlive(wantKeepAlive: true);

    useEffect(() {
      final f = (() async {
        if (premiumAndTrial.isLoading) {
          return;
        }
        try {
          syncUserStatus(premiumAndTrial: premiumAndTrial.asData?.value);
        } catch (error) {
          debugPrint(error.toString());
        }
      });

      f();
      return null;
    }, [premiumAndTrial.asData?.value]);

    useEffect(() {
      final f = (() async {
        if (setting.isLoading) {
          return;
        }
        try {
          syncSetting(setting: setting.asData?.value);
        } catch (error) {
          debugPrint(error.toString());
        }
      });

      f();
      return null;
    }, [setting.asData?.value]);

    useEffect(() {
      final f = (() async {
        if (latestPillSheetGroup.isLoading) {
          return;
        }
        try {
          syncActivePillSheetValue(pillSheetGroup: latestPillSheetGroup.asData?.value);
        } catch (error) {
          debugPrint(error.toString());
        }
      });

      f();
      return null;
    }, [latestPillSheetGroup.asData?.value]);

    final isLinked = ref.watch(isLinkedProvider);
    return AsyncValueGroup.group4(
      ref.watch(latestPillSheetGroupProvider),
      ref.watch(premiumAndTrialProvider),
      ref.watch(settingProvider),
      ref.watch(userProvider),
    ).when(
      data: (data) {
        final latestPillSheetGroup = data.t1;
        final premiumAndTrial = data.t2;
        final setting = data.t3;
        return RecordPageBody(
          pillSheetGroup: latestPillSheetGroup,
          setting: setting,
          premiumAndTrial: premiumAndTrial,
          isLinkedLoginProvider: isLinked,
        );
      },
      error: (error, stackTrace) => UniversalErrorPage(
        error: error,
        reload: () => ref.refresh(refreshAppProvider),
        child: null,
      ),
      loading: () => const Indicator(),
    );
  }
}

// TODO: pillSheetGroup.activedPillSheet.restDurations を更新したときに画面が変更されるかを確認する。（timestampを使っていた部分のテスト）
class RecordPageBody extends HookConsumerWidget {
  final PillSheetGroup? pillSheetGroup;
  final Setting setting;
  final PremiumAndTrial premiumAndTrial;
  final bool isLinkedLoginProvider;

  const RecordPageBody({
    Key? key,
    required this.pillSheetGroup,
    required this.setting,
    required this.premiumAndTrial,
    required this.isLinkedLoginProvider,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pillSheetGroup = this.pillSheetGroup;
    final activePillSheet = pillSheetGroup?.activedPillSheet;

    return Scaffold(
      backgroundColor: PilllColors.background,
      appBar: AppBar(
        titleSpacing: 0,
        backgroundColor: PilllColors.white,
        toolbarHeight: RecordPageInformationHeaderConst.height,
        title: Stack(
          children: [
            RecordPageInformationHeader(
              today: DateTime.now(),
              pillSheetGroup: pillSheetGroup,
              setting: setting,
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                const AnnouncementBar(),
                const SizedBox(height: 37),
                _content(context),
                const SizedBox(height: 20),
              ],
            ),
          ),
          if (activePillSheet != null && pillSheetGroup != null && !pillSheetGroup.isDeactived) ...[
            RecordPageButton(
              pillSheetGroup: pillSheetGroup,
              currentPillSheet: activePillSheet,
              userIsPremiumOtTrial: premiumAndTrial.premiumOrTrial,
            ),
            const SizedBox(height: 40),
          ],
        ],
      ),
    );
  }

  Widget _content(BuildContext context) {
    final pillSheetGroup = this.pillSheetGroup;
    final activedPillSheet = pillSheetGroup?.activedPillSheet;
    if (activedPillSheet == null || pillSheetGroup == null || pillSheetGroup.isDeactived) {
      return AddPillSheetGroupEmptyFrame(
        context: context,
        pillSheetGroup: pillSheetGroup,
        setting: setting,
      );
    } else {
      return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          RecordPagePillSheetSupportActions(
            pillSheetGroup: pillSheetGroup,
            activedPillSheet: activedPillSheet,
            setting: setting,
            premiumAndTrial: premiumAndTrial,
          ),
          const SizedBox(height: 16),
          RecordPagePillSheetList(
            pillSheetGroup: pillSheetGroup,
            activePillSheet: activedPillSheet,
            setting: setting,
            premiumAndTrial: premiumAndTrial,
          ),
        ],
      );
    }
  }
}
