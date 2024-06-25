import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CommonTextField extends HookConsumerWidget {
  const CommonTextField({
    super.key,
    this.hintText = '',
    this.textFieldValue = '',
  });

  final String hintText;
  final String textFieldValue;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textEditingController =
        useTextEditingController(text: textFieldValue);
    final textFieldState = useState(textFieldValue);

    return TextField(
      controller: textEditingController,
      decoration: InputDecoration(
        hintText: hintText == '' ? '$hintTextを入力' : null,
      ),
      onChanged: (String text) {
        textFieldState.value = text;
      },
    );
  }
}
