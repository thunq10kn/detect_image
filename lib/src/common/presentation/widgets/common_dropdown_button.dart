import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CommonDropdownButton extends HookConsumerWidget {
  const CommonDropdownButton({
    super.key,
    required this.menuItems,
    this.hintText = '',
    this.textFieldValue = '',
  });

  final List<Map<String, String>> menuItems;
  final String hintText;
  final String textFieldValue;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textFieldState = useState(textFieldValue);

    return DropdownButton(
      items: List.generate(
        menuItems.length,
        (index) => DropdownMenuItem(
          value: menuItems[index]['value'],
          child: Text(menuItems[index]['text']!),
        ),
      ),
      onChanged: (String? value) {
        textFieldState.value = value!;
      },
      value: textFieldState.value,
    );
  }
}
