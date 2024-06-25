import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CopyableText extends Text {
  const CopyableText(
    super.data, {
    super.key,
    super.style,
    super.overflow,
    this.prefixText = '',
  });

  final String prefixText;

  @override
  Widget build(BuildContext context) {
    const tooltipText = 'コピー';
    const snackbarText = 'クリップボードにコピーしました';

    return Tooltip(
      message: tooltipText,
      child: InkWell(
        onTap: () async {
          await Clipboard.setData(ClipboardData(text: data ?? ''));
          await Future.microtask(() {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  prefixText != '' ? '$prefixTextを$snackbarText' : snackbarText,
                ),
              ),
            );
          });
        },
        child: super.build(context),
      ),
    );
  }
}
