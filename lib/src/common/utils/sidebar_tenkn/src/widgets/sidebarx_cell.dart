import 'package:flutter/material.dart';
import 'package:rem_admin/src/common/presentation/app_colors.dart';
import 'package:rem_admin/src/common/utils/image_helper/imagehelper.dart';

import '../../sidebarx.dart';

class SidebarXCell extends StatefulWidget {
  const SidebarXCell({
    Key? key,
    required this.item,
    required this.extended,
    required this.selected,
    required this.theme,
    required this.onTap,
    required this.index,
    required this.animationController,
  }) : super(key: key);

  final bool extended;
  final bool selected;
  final int index;
  final SidebarXItem item;
  final SidebarXTheme theme;
  final VoidCallback onTap;
  final AnimationController animationController;

  @override
  State<SidebarXCell> createState() => _SidebarXCellState();
}

class _SidebarXCellState extends State<SidebarXCell> {
  late Animation<double> _animation;
  var _hovered = false;

  @override
  void initState() {
    super.initState();
    _animation = CurvedAnimation(
      parent: widget.animationController,
      curve: Curves.easeIn,
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = widget.theme;
    final iconTheme =
        widget.selected ? theme.selectedIconTheme : theme.iconTheme;
    final textStyle = widget.selected
        ? theme.selectedTextStyle
        : (_hovered)
            ? theme.hoverTextStyle
            : theme.textStyle;
    final decoration =
        (widget.selected ? theme.selectedItemDecoration : theme.itemDecoration);
    final margin =
        (widget.selected ? theme.selectedItemMargin : theme.itemMargin);
    final padding =
        (widget.selected ? theme.selectedItemPadding : theme.itemPadding);
    final textPadding =
        widget.selected ? theme.selectedItemTextPadding : theme.itemTextPadding;

    return MouseRegion(
      onEnter: (_) => _onEnteredCellZone(),
      onExit: (_) => _onExitCellZone(),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: widget.onTap,
        behavior: HitTestBehavior.opaque,
        child: Container(
          decoration: decoration?.copyWith(
            color: _hovered && !widget.selected ? theme.hoverColor : null,
          ),
          padding: padding ??
              const EdgeInsets.symmetric(vertical: 17, horizontal: 13),
          margin: margin ?? const EdgeInsets.symmetric(horizontal: 17),
          child: Row(
            mainAxisAlignment: widget.extended
                ? MainAxisAlignment.start
                : MainAxisAlignment.center,
            children: [
              AnimatedBuilder(
                animation: _animation,
                builder: (context, _) {
                  final value = ((1 - _animation.value) * 6).toInt();
                  if (value <= 0) {
                    return const SizedBox();
                  }
                  return Spacer(flex: value);
                },
              ),
              if (widget.item.icon != null)
                _Icon(item: widget.item, iconTheme: iconTheme)
              else if (widget.item.iconWidget != null)
                SizedBox(
                  width: (iconTheme?.size ?? 0) + 16,
                  height: (iconTheme?.size ?? 0) + 16,
                  child: Stack(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: ImageHelper.loadFromAsset(
                            widget.item.iconWidget!,
                            tintColor: iconTheme?.color,
                            width: iconTheme?.size,
                            height: iconTheme?.size),
                      ),
                      if (widget.item.isShowNotification == true)
                        Positioned(
                          top: 0,
                          right: 5,
                          child: Container(
                            width: 8,
                            height: 8,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.redAccent,
                            ),
                          ),
                        )
                    ],
                  ),
                ),
              Flexible(
                flex: 6,
                child: FadeTransition(
                  opacity: _animation,
                  child: Padding(
                    padding: textPadding ?? EdgeInsets.zero,
                    child: Row(
                      children: [
                        Text(
                          widget.item.label ?? '',
                          style: widget.item.style ?? textStyle,
                          overflow: TextOverflow.fade,
                          maxLines: 1,
                        ),
                        const SizedBox(
                          width: 14,
                        ),
                        if (widget.item.tag != null)
                          Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 3, horizontal: 10),
                            decoration: BoxDecoration(
                                color: AppColors.customColor13,
                                borderRadius: BorderRadius.circular(20)),
                            child: Center(
                              child: Text(
                                widget.item.tag ?? '',
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 7.7,
                                    fontWeight: FontWeight.w600),
                                overflow: TextOverflow.fade,
                                maxLines: 1,
                              ),
                            ),
                          )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _onEnteredCellZone() {
    setState(() => _hovered = true);
  }

  void _onExitCellZone() {
    setState(() => _hovered = false);
  }
}

class _Icon extends StatelessWidget {
  const _Icon({
    Key? key,
    required this.item,
    required this.iconTheme,
  }) : super(key: key);

  final SidebarXItem item;
  final IconThemeData? iconTheme;

  @override
  Widget build(BuildContext context) {
    return Icon(
      item.icon,
      color: iconTheme?.color,
      size: iconTheme?.size,
    );
  }
}
