import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../app_colors.dart';

class GradientButton extends StatelessWidget {
  final Gradient gradient;
  final double borderRadius;
  final double height;
  final double width;
  final String? title;
  final TextStyle? style;
  final Widget? child;
  final Color? hoverColor;
  final EdgeInsets? margin;
  final EdgeInsets? padding;
  final BorderSide? border;
  final VoidCallback? onTap;

  const GradientButton({
    super.key,
    this.title,
    this.style,
    this.child,
    this.onTap,
    this.hoverColor,
    this.margin,
    this.padding,
    this.borderRadius = 16,
    this.height = 50,
    this.width = double.infinity,
    this.gradient = const LinearGradient(
        colors: AppColors.linerColor,
        begin: FractionalOffset(0.0, 0.0),
        end: FractionalOffset(1.0, 0.0),
        stops: [0.0, 1.0],
        tileMode: TileMode.clamp),
    this.border,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onTap,
      child: Container(
        height: height,
        width: width,
        margin: margin,
        padding:
            padding ?? const EdgeInsets.symmetric(vertical: 8, horizontal: 24),
        decoration: ShapeDecoration(
          gradient: gradient,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
            side: border ?? BorderSide.none,
          ),
        ),
        child: title != null
            ? Center(
                child: Text(
                  title!,
                  style: style ??
                      const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
                      ),
                ),
              )
            : child,
      ),
    );
  }
}

class FilledColorButton extends StatelessWidget {
  final Color? color;
  final double borderRadius;
  final double height;
  final double width;
  final String? title;
  final TextStyle? style;
  final Widget? child;
  final Color? hoverColor;
  final EdgeInsets? margin;
  final EdgeInsets? padding;
  final VoidCallback? onTap;
  final BorderSide? border;
  final Gradient? backgroundColorGradient;

  const FilledColorButton({
    super.key,
    this.title,
    this.child,
    this.onTap,
    this.hoverColor,
    this.margin,
    this.padding,
    this.borderRadius = 16,
    this.height = 50,
    this.width = double.infinity,
    this.color,
    this.border,
    this.style,
    this.backgroundColorGradient,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onTap,
      child: Container(
        height: height,
        width: width,
        margin: margin,
        padding:
            padding ?? const EdgeInsets.symmetric(vertical: 8, horizontal: 24),
        decoration: ShapeDecoration(
          color: color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
            side: border ?? BorderSide.none,
          ),
          gradient: backgroundColorGradient,
        ),
        child: title != null
            ? Center(
                child: Text(
                  title!,
                  style: style ??
                      TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: AppColors.customColor6,
                      ),
                ),
              )
            : child,
      ),
    );
  }
}

/// Common [TextButton].
class CommonTextButton extends StatelessWidget {
  const CommonTextButton({
    super.key,
    required this.text,
    this.textStyle,
    this.onPressed,
    this.buttonStyle,
  });
  final String text;
  final TextStyle? textStyle;
  final Future<void> Function()? onPressed;
  final ButtonStyle? buttonStyle;

  @override
  Widget build(BuildContext context) {
    return _CommonButtonBuilder(
      asyncCallback: onPressed,
      builder: (context, asyncCallback, isLoading) {
        return TextButton(
          onPressed: asyncCallback,
          style: buttonStyle,
          child: Text(
            text,
            style: textStyle,
            textAlign: TextAlign.center,
          ),
        );
      },
    );
  }
}

/// Common [ElevatedButton].
class CommonElevatedButton extends StatelessWidget {
  const CommonElevatedButton({
    super.key,
    required this.text,
    this.textStyle,
    this.onPressed,
    this.buttonStyle,
    this.width,
    this.height = 30,
  });
  final String text;
  final TextStyle? textStyle;
  final Future<void> Function()? onPressed;
  final ButtonStyle? buttonStyle;
  final double? width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return _CommonButtonBuilder(
      asyncCallback: onPressed,
      builder: (context, asyncCallback, isLoading) {
        return SizedBox(
          width: width,
          height: height,
          child: ElevatedButton(
            onPressed: asyncCallback,
            style: buttonStyle,
            child: Text(
              text,
              style: textStyle,
              textAlign: TextAlign.center,
            ),
          ),
        );
      },
    );
  }
}

/// Common FilledButton based [ElevatedButton].
class CommonFilledButton extends StatelessWidget {
  const CommonFilledButton({
    super.key,
    required this.text,
    this.textStyle,
    this.onPressed,
    this.buttonStyle,
    this.width,
    this.height = 30,
  });
  final String text;
  final TextStyle? textStyle;
  final Future<void> Function()? onPressed;
  final ButtonStyle? buttonStyle;
  final double? width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return _CommonButtonBuilder(
      asyncCallback: onPressed,
      builder: (context, asyncCallback, isLoading) {
        return SizedBox(
          width: width,
          height: height,
          child: ElevatedButton(
            onPressed: asyncCallback,
            // style: buttonStyle,
            style: buttonStyle?.copyWith(
                  elevation: ButtonStyleButton.allOrNull(0),
                ) ??
                ElevatedButton.styleFrom(
                  foregroundColor: Theme.of(context).colorScheme.onPrimary,
                  backgroundColor: Theme.of(context).colorScheme.primary,
                ).copyWith(elevation: ButtonStyleButton.allOrNull(0)),
            child: Text(
              text,
              style: textStyle,
              textAlign: TextAlign.center,
            ),
          ),
        );
      },
    );
  }
}

/// Common [IconButton].
class CommonIconButton extends StatelessWidget {
  const CommonIconButton({
    super.key,
    required this.icon,
    this.onPressed,
    this.buttonStyle,
  });
  final Widget icon;
  final Future<void> Function()? onPressed;
  final ButtonStyle? buttonStyle;

  @override
  Widget build(BuildContext context) {
    return _CommonButtonBuilder(
      asyncCallback: onPressed,
      builder: (context, asyncCallback, isLoading) {
        return IconButton(
          onPressed: asyncCallback,
          style: buttonStyle,
          icon: icon,
        );
      },
    );
  }
}

/// Common [TextButton].
class CommonIconTextButton extends StatelessWidget {
  const CommonIconTextButton({
    super.key,
    required this.icon,
    required this.text,
    this.textStyle,
    this.margin = 8,
    this.onPressed,
    this.buttonStyle,
  });

  final Widget icon;
  final String text;
  final TextStyle? textStyle;
  final double margin;
  final Future<void> Function()? onPressed;
  final ButtonStyle? buttonStyle;

  @override
  Widget build(BuildContext context) {
    return _CommonButtonBuilder(
      asyncCallback: onPressed,
      builder: (context, asyncCallback, isLoading) {
        return TextButton(
          onPressed: asyncCallback,
          style: buttonStyle,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              icon,
              SizedBox(width: margin),
              Flexible(
                child: Text(
                  text,
                  style: textStyle,
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

/// Button builder to prevent consecutive hits.
class _CommonButtonBuilder extends StatefulHookConsumerWidget {
  const _CommonButtonBuilder({
    this.asyncCallback,
    required this.builder,
  });
  final Future<void> Function()? asyncCallback;
  final Widget Function(
    BuildContext context,
    Future<void> Function()? asyncCallback,
    bool isLoading,
  ) builder;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _CommonButtonBuilderState();
}

class _CommonButtonBuilderState extends ConsumerState<_CommonButtonBuilder> {
  @override
  Widget build(BuildContext context) {
    if (widget.asyncCallback == null) {
      return widget.builder(context, null, false);
    }
    final isLoading = useState(false);

    return widget.builder(
      context,
      () async {
        if (isLoading.value) {
          return;
        }
        if (mounted) {
          isLoading.value = true;
        }
        try {
          await widget.asyncCallback!();
        } finally {
          if (mounted) {
            isLoading.value = false;
          }
        }
      },
      isLoading.value,
    );
  }
}

enum Buttons { primary, secondary, tertiary, quaternary, quinary }

class CommonMultipleChoiceButton extends HookWidget {
  const CommonMultipleChoiceButton({
    super.key,
    required this.segmentTitles,
    required this.selectedButtons,
    this.showSelectedIcon = false,
    this.multiSelectionEnabled = true,
    this.emptySelectionAllowed = true,
    this.width = 300,
    this.isDisabled = false,
  });

  final List<String> segmentTitles;
  final double width;
  final bool isDisabled;
  final bool showSelectedIcon;
  final bool multiSelectionEnabled;
  final bool emptySelectionAllowed;
  final ValueNotifier<Set<Buttons>> selectedButtons;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40, // TODO: remove this when the bug is fixed
      width: width,
      child: SegmentedButton<Buttons>(
        segments: segmentTitles
            .asMap()
            .entries
            .map(
              (segmentTitle) => ButtonSegment<Buttons>(
                value: Buttons.values[segmentTitle.key],
                label: SizedBox(
                  height: 25, // TODO: remove this when the bug is fixed
                  child: Text(
                    segmentTitle.value,
                    style: const TextStyle(
                      fontSize: 12,
                    ),
                  ),
                ),
                //  TODO
                // icon: Container(
                //   margin: const EdgeInsets.only(bottom: 5),
                //   child: !selectedButtons.value
                //           .contains(Buttons.values[segmentTitle.key])
                //       ? const Icon(
                //           Icons.east,
                //         )
                //       : const Icon(null),
                //   ),
                // ),
              ),
            )
            .toList(),
        selected: selectedButtons.value,
        onSelectionChanged: !isDisabled
            ? (selected) {
                selectedButtons.value = {...selected};
              }
            : null,
        showSelectedIcon: showSelectedIcon,
        multiSelectionEnabled: multiSelectionEnabled,
        emptySelectionAllowed: emptySelectionAllowed,
      ),
    );
  }
}
