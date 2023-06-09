import 'package:flutter/material.dart';
import 'package:pilll/components/atoms/color.dart';

class RowLayout extends StatelessWidget {
  final Widget day;
  final Widget effectiveNumbersOrHyphen;
  final Widget detail;
  final Widget? takenPillActionOList;

  const RowLayout({
    Key? key,
    required this.day,
    required this.effectiveNumbersOrHyphen,
    required this.detail,
    this.takenPillActionOList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final takenPillActionOList = this.takenPillActionOList;
    return Container(
      padding: const EdgeInsets.only(left: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          day,
          const SizedBox(width: 8),
          const SizedBox(
            height: 26,
            child: VerticalDivider(
              color: PilllColors.divider,
              width: 0.5,
            ),
          ),
          const SizedBox(width: 8),
          SizedBox(
            width: 79,
            child: effectiveNumbersOrHyphen,
          ),
          const SizedBox(width: 8),
          Expanded(
            child: detail,
          ),
          if (takenPillActionOList != null) ...[
            const SizedBox(width: 8),
            SizedBox(
              width: 57,
              child: takenPillActionOList,
            ),
          ],
        ],
      ),
    );
  }
}
