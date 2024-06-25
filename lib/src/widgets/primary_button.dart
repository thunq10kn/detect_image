import 'package:flutter/material.dart';

import '../common/utils/contants/app_sizes.dart';

/// Primary button based on [ElevatedButton].
class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    Key? key,
    required this.text,
    this.isLoading = false,
    this.onPressed,
  }) : super(key: key);
  final String text;
  final bool isLoading;
  final VoidCallback? onPressed;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Sizes.p48,
      child: ElevatedButton(
        onPressed: onPressed,
        child: isLoading
            ? const CircularProgressIndicator()
            : Text(
                text,
                textAlign: TextAlign.center,
                style: Theme.of(context)
                    .textTheme
                    .headline6!
                    .copyWith(color: Colors.white),
              ),
      ),
    );
  }
}
