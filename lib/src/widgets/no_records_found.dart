import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:rem_admin/src/common/utils/localization/string_hardcoded.dart';

class NoRecordsFound extends StatelessWidget {
  const NoRecordsFound({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      color: Colors.white,
      child: Center(
        child: Column(
          children: [
            const Gap(30),
            Text(
              'データがありません。'.hc,
              style: Theme.of(context).textTheme.headline4,
            ),
            const Gap(20)
          ],
        ),
      ),
    );
  }
}
