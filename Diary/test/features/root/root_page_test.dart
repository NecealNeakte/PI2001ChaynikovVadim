import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:pilll/components/molecules/indicator.dart';
import 'package:pilll/entity/setting.codegen.dart';
import 'package:pilll/entity/user.codegen.dart';
import 'package:pilll/features/root/initial_setting_or_app_page.dart';
import 'package:pilll/features/root/root_page.dart';
import 'package:pilll/provider/auth.dart';
import 'package:pilll/provider/database.dart';
import 'package:pilll/provider/force_update.dart';
import 'package:pilll/provider/set_user_id.dart';
import 'package:pilll/provider/user.dart';
import 'package:pilll/utils/analytics.dart';
import 'package:pilll/utils/environment.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mockito/mockito.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:pilll/utils/error_log.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../helper/fake.dart';
import '../../helper/mock.mocks.dart';

class _FakeFirebaseUser extends Fake implements firebase_auth.User {
  @override
  String get uid => "abcdefg";
}

class _FakeWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class _FakeUser extends Fake implements User {
  final bool fakeMigratedFlutter;
  final Setting? fakeSetting;

  // ignore: avoid_init_to_null
  _FakeUser([this.fakeMigratedFlutter = false, this.fakeSetting = null]);

  @override
  bool get migratedFlutter => fakeMigratedFlutter;

  @override
  Setting? get setting => fakeSetting;
}

class _FakeSetting extends Fake implements Setting {}

void main() {
  setUp(() {
    TestWidgetsFlutterBinding.ensureInitialized();
    initializeDateFormatting('ja_JP');
    Environment.isTest = true;
    analytics = FakeAnalytics();
    errorLogger = FakeErrorLogger();
    WidgetsBinding.instance.renderView.configuration = TestViewConfiguration(size: const Size(375.0, 667.0));
  });

  group('#RootPage', () {
    testWidgets('no need force update', (WidgetTester tester) async {
      final fakeFirebaseUser = _FakeFirebaseUser();
      final fakeUser = _FakeUser();

      final checkForceUpdate = MockCheckForceUpdate();
      when(checkForceUpdate()).thenAnswer((_) => Future.value(false));

      final setUserID = MockSetUserID();
      when(setUserID(userID: fakeFirebaseUser.uid)).thenAnswer((realInvocation) => Future.value());

      final fetchOrCreateUser = MockFetchOrCreateUser();
      when(fetchOrCreateUser(fakeFirebaseUser.uid)).thenAnswer((realInvocation) => Future.value(fakeUser));

      final saveUserLaunchInfo = MockSaveUserLaunchInfo();
      when(saveUserLaunchInfo(fakeUser)).thenReturn(null);

      final markAsMigratedToFlutter = MockMarkAsMigratedToFlutter();
      when(markAsMigratedToFlutter()).thenAnswer((realInvocation) => Future.value());

      SharedPreferences.setMockInitialValues({});

      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            checkForceUpdateProvider.overrideWith((_) => checkForceUpdate),
            setUserIDProvider.overrideWith((ref) => setUserID),
            databaseProvider.overrideWith((ref) => MockDatabaseConnection()),
            fetchOrCreateUserProvider.overrideWith((_) => fetchOrCreateUser),
            saveUserLaunchInfoProvider.overrideWith((ref) => saveUserLaunchInfo),
            markAsMigratedToFlutterProvider.overrideWith((ref) => markAsMigratedToFlutter),
            firebaseSignInProvider.overrideWith((ref) => Future.value(fakeFirebaseUser)),
            didEndInitialSettingProvider.overrideWithValue(const AsyncValue.data(null)),
          ],
          child: MaterialApp(
            home: Material(
              child: RootPage(builder: (_, __) => _FakeWidget()),
            ),
          ),
        ),
      );
      await tester.pump();

      expect(
        find.byWidgetPredicate((widget) => widget is _FakeWidget),
        findsOneWidget,
      );
    });
    testWidgets('needs force update', (WidgetTester tester) async {
      final fakeFirebaseUser = _FakeFirebaseUser();
      final fakeUser = _FakeUser();

      final checkForceUpdate = MockCheckForceUpdate();
      when(checkForceUpdate()).thenAnswer((_) => Future.value(true));

      final setUserID = MockSetUserID();
      when(setUserID(userID: fakeFirebaseUser.uid)).thenAnswer((realInvocation) => Future.value());

      final fetchOrCreateUser = MockFetchOrCreateUser();
      when(fetchOrCreateUser(fakeFirebaseUser.uid)).thenAnswer((realInvocation) => Future.value(fakeUser));

      final saveUserLaunchInfo = MockSaveUserLaunchInfo();
      when(saveUserLaunchInfo(fakeUser)).thenReturn(null);

      final markAsMigratedToFlutter = MockMarkAsMigratedToFlutter();
      when(markAsMigratedToFlutter()).thenAnswer((realInvocation) => Future.value());

      SharedPreferences.setMockInitialValues({});

      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            checkForceUpdateProvider.overrideWith((_) => checkForceUpdate),
            setUserIDProvider.overrideWith((ref) => setUserID),
            databaseProvider.overrideWith((ref) => MockDatabaseConnection()),
            fetchOrCreateUserProvider.overrideWith((_) => fetchOrCreateUser),
            saveUserLaunchInfoProvider.overrideWith((ref) => saveUserLaunchInfo),
            markAsMigratedToFlutterProvider.overrideWith((ref) => markAsMigratedToFlutter),
            firebaseSignInProvider.overrideWith((ref) => Future.value(fakeFirebaseUser)),
            didEndInitialSettingProvider.overrideWithValue(const AsyncValue.data(null)),
          ],
          child: MaterialApp(
            home: Material(
              child: RootPage(builder: (_, __) => _FakeWidget()),
            ),
          ),
        ),
      );
      await tester.pump();

      expect(
        find.byWidgetPredicate((widget) => widget is ScaffoldIndicator),
        findsOneWidget,
      );
      expect(
        find.byWidgetPredicate((widget) => widget is _FakeWidget),
        findsNothing,
      );
// FIXME: Cann't check of did showDialog Widget
//      expect(
//        find.byWidgetPredicate((widget) => widget is OKDialog),
//        findsOneWidget,
//      );
    });
  });

  group('#retrieveScreenType', () {
    testWidgets('didEndInitialSetting is not exist', (WidgetTester tester) async {
      final fakeUser = _FakeUser(true, _FakeSetting());
      final screenType = retrieveScreenType(user: fakeUser, didEndInitialSettingAsyncValue: const AsyncData(null));
      expect(screenType, InitialSettingOrAppPageScreenType.initialSetting);
    });
    testWidgets('didEndInitialSetting is false', (WidgetTester tester) async {
      final fakeUser = _FakeUser(true, _FakeSetting());
      final screenType = retrieveScreenType(user: fakeUser, didEndInitialSettingAsyncValue: const AsyncData(false));
      expect(screenType, InitialSettingOrAppPageScreenType.initialSetting);
    });
    testWidgets('didEndInitialSetting is true', (WidgetTester tester) async {
      final fakeUser = _FakeUser(true, _FakeSetting());
      final screenType = retrieveScreenType(user: fakeUser, didEndInitialSettingAsyncValue: const AsyncData(true));
      expect(screenType, InitialSettingOrAppPageScreenType.app);
    });
    testWidgets('didEndInitialSetting is true and user.migratedFlutter is false', (WidgetTester tester) async {
      final fakeUser = _FakeUser(false, _FakeSetting());
      final screenType = retrieveScreenType(user: fakeUser, didEndInitialSettingAsyncValue: const AsyncData(true));
      expect(screenType, InitialSettingOrAppPageScreenType.initialSetting);
    });
    testWidgets('didEndInitialSetting is true and user.migratedFlutter is true but setting is null', (WidgetTester tester) async {
      final fakeUser = _FakeUser(true, null);
      final screenType = retrieveScreenType(user: fakeUser, didEndInitialSettingAsyncValue: const AsyncData(true));
      expect(screenType, InitialSettingOrAppPageScreenType.initialSetting);
    });
  });
}
