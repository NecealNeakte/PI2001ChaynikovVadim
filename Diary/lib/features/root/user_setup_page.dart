import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pilll/features/root/initial_setting_or_app_page.dart';
import 'package:pilll/features/root/launch_exception.dart';
import 'package:pilll/utils/analytics.dart';
import 'package:pilll/entity/user.codegen.dart';
import 'package:pilll/provider/root.dart';
import 'package:pilll/components/molecules/indicator.dart';
import 'package:pilll/features/error/template.dart';
import 'package:pilll/features/error/universal_error_page.dart';
import 'package:pilll/utils/error_log.dart';
import 'package:pilll/provider/user.dart';
import 'package:flutter/material.dart';

// Userの作成・もしくは取得を行い次のWidgetに渡す
class UserSetupPage extends HookConsumerWidget {
  final String userID;
  const UserSetupPage({Key? key, required this.userID}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final fetchOrCreateUser = ref.watch(fetchOrCreateUserProvider);
    final saveUserLaunchInfo = ref.watch(saveUserLaunchInfoProvider);

    final appUser = useState<User?>(null);
    final error = useState<LaunchException?>(null);

    // Setup user
    useEffect(() {
      void f() async {
        // **** BEGIN: Do not break the sequence. ****
        try {
          // Decide screen type. Keep in mind that this method is called when user is logged in.
          final appUserValue = appUser.value;
          if (appUserValue == null) {
            // Retrieve user from app DB.
            final user = await fetchOrCreateUser(userID);
            appUser.value = user;
          }
        } catch (e, st) {
          errorLogger.recordError(e, st);
          error.value = LaunchException("起動時にエラーが発生しました\n${ErrorMessages.connection}\n詳細:", e);
        }
        // **** END: Do not break the sequence. ****
      }

      f();
      return null;
    }, []);

    useEffect(() {
      final appUserValue = appUser.value;
      if (appUserValue != null) {
        saveUserLaunchInfo(appUserValue);
      }
      return null;
    }, [appUser.value]);

    return UniversalErrorPage(
      error: error.value,
      reload: () => ref.refresh(refreshAppProvider),
      child: () {
        final appUserValue = appUser.value;
        if (appUserValue == null) {
          return const ScaffoldIndicator();
        } else {
          return const InitialSettingOrAppPage();
        }
      }(),
    );
  }
}

InitialSettingOrAppPageScreenType retrieveScreenType({
  required User? user,
  required AsyncValue<bool> userDocumentIsExist,
  required AsyncValue<bool?> didEndInitialSettingAsyncValue,
}) {
  if (userDocumentIsExist is! AsyncData || userDocumentIsExist.requireValue == false) {
    return InitialSettingOrAppPageScreenType.loading;
  }
  if (user == null || didEndInitialSettingAsyncValue is! AsyncData) {
    return InitialSettingOrAppPageScreenType.loading;
  }
  if (!user.migratedFlutter) {
    return InitialSettingOrAppPageScreenType.initialSetting;
  } else if (user.setting == null) {
    return InitialSettingOrAppPageScreenType.initialSetting;
  }

  final didEndInitialSetting = didEndInitialSettingAsyncValue.value;
  if (didEndInitialSetting == null) {
    analytics.logEvent(name: "did_end_i_s_is_null");
    return InitialSettingOrAppPageScreenType.initialSetting;
  }
  if (!didEndInitialSetting) {
    analytics.logEvent(name: "did_end_i_s_is_false");
    return InitialSettingOrAppPageScreenType.initialSetting;
  }

  analytics.logEvent(name: "screen_type_is_home");
  return InitialSettingOrAppPageScreenType.app;
}
