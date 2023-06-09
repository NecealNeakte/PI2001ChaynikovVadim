import 'dart:io';

import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:pilll/utils/analytics.dart';
import 'package:pilll/components/atoms/button.dart';
import 'package:pilll/components/atoms/color.dart';
import 'package:pilll/components/atoms/font.dart';
import 'package:pilll/components/atoms/text_color.dart';
import 'package:flutter/material.dart';
import 'package:pilll/utils/shared_preference/keys.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ReleaseNote extends StatelessWidget {
  const ReleaseNote({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 35, right: 35),
      child: Material(
        type: MaterialType.transparency,
        child: Center(
          child: Container(
            decoration: BoxDecoration(
              color: PilllColors.white,
              borderRadius: BorderRadius.circular(4),
            ),
            constraints: const BoxConstraints(maxWidth: 320),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Stack(
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: IconButton(
                        icon: const Icon(Icons.close, color: Colors.black),
                        onPressed: () => Navigator.of(context).pop(),
                      ),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Container(
                        padding: const EdgeInsets.only(top: 40, left: 40, right: 40),
                        child: const Text(
                          "ホームウィジェットが追加できるようになりました",
                          style: TextStyle(
                            fontFamily: FontFamily.japanese,
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                            color: TextColor.black,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 25, left: 25, right: 25),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        '''
ホームウィジェットを追加できるようになりました。本日服用するピルの番号が一目でわかるようになっています
                        ''',
                        style: TextStyle(
                          fontFamily: FontFamily.japanese,
                          fontWeight: FontWeight.w300,
                          fontSize: 14,
                          color: TextColor.main,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 230,
                  child: AlertButton(
                      onPressed: () async {
                        analytics.logEvent(name: "pressed_show_release_note");
                        Navigator.of(context).pop();
                        openReleaseNote();
                      },
                      text: "詳細を見る"),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

void showReleaseNotePreDialog(BuildContext context) async {
  final String key;
  if (Platform.isAndroid) {
    key = ReleaseNoteKey.version3_16_0;
  } else {
    key = ReleaseNoteKey.version3_15_0;
  }
  final storage = await SharedPreferences.getInstance();
  if (storage.getBool(key) ?? false) {
    return;
  }
  await storage.setBool(key, true);

  // ignore: use_build_context_synchronously
  showDialog(
      context: context,
      builder: (context) {
        return const ReleaseNote();
      });
}

void openReleaseNote() async {
  final ChromeSafariBrowser browser = ChromeSafariBrowser();
  await browser.open(
      url: Uri.parse("https://pilll.wraptas.site/80cadcaca73b41f4974a568b6e753a2b"),
      options: ChromeSafariBrowserClassOptions(
          android: AndroidChromeCustomTabsOptions(shareState: CustomTabsShareState.SHARE_STATE_OFF),
          ios: IOSSafariOptions(barCollapsingEnabled: true, presentationStyle: IOSUIModalPresentationStyle.PAGE_SHEET)));
}
