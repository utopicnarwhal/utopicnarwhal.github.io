import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

enum CustomIconButtonType {
  standard,
  filled,
  tonal,
  outlined,
}

class CustomIconButton extends StatelessWidget {
  const CustomIconButton({
    super.key,
    required this.onPressed,
    required this.icon,
    this.selectedIcon,
    this.tooltip,
    this.isSelected = true,
    this.type = CustomIconButtonType.standard,
    this.focusNode,
  });

  final VoidCallback? onPressed;
  final bool isSelected;
  final Widget icon;
  final Widget? selectedIcon;
  final String? tooltip;
  final CustomIconButtonType type;
  final FocusNode? focusNode;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    ButtonStyle? style;
    switch (type) {
      case CustomIconButtonType.filled:
        style = onPressed != null
            ? _enabledFilledButtonStyle(isSelected, colorScheme)
            : _disabledFilledButtonStyle(isSelected, colorScheme);
        break;
      case CustomIconButtonType.tonal:
        style = onPressed != null
            ? _enabledFilledTonalButtonStyle(isSelected, colorScheme)
            : _disabledFilledTonalButtonStyle(isSelected, colorScheme);
        break;
      case CustomIconButtonType.outlined:
        style = onPressed != null
            ? _enabledOutlinedButtonStyle(isSelected, colorScheme)
            : _disabledOutlinedButtonStyle(isSelected, colorScheme);
        break;
      default:
    }

    return IconButton(
      onPressed: onPressed,
      focusNode: focusNode,
      isSelected: isSelected,
      icon: icon,
      selectedIcon: selectedIcon,
      tooltip: tooltip,
      style: style,
    );
  }

  static ButtonStyle _enabledFilledButtonStyle(bool selected, ColorScheme colors) {
    return IconButton.styleFrom(
      foregroundColor: selected ? colors.onPrimary : colors.primary,
      backgroundColor: selected ? colors.primary : colors.surfaceVariant,
      disabledForegroundColor: colors.onSurface.withOpacity(0.38),
      disabledBackgroundColor: colors.onSurface.withOpacity(0.12),
      hoverColor: selected ? colors.onPrimary.withOpacity(0.08) : colors.primary.withOpacity(0.08),
      focusColor: selected ? colors.onPrimary.withOpacity(0.12) : colors.primary.withOpacity(0.12),
      highlightColor: selected ? colors.onPrimary.withOpacity(0.12) : colors.primary.withOpacity(0.12),
    );
  }

  static ButtonStyle _disabledFilledButtonStyle(bool selected, ColorScheme colors) {
    return IconButton.styleFrom(
      disabledForegroundColor: colors.onSurface.withOpacity(0.38),
      disabledBackgroundColor: colors.onSurface.withOpacity(0.12),
    );
  }

  static ButtonStyle _enabledFilledTonalButtonStyle(bool selected, ColorScheme colors) {
    return IconButton.styleFrom(
      foregroundColor: selected ? colors.primary : colors.onSurfaceVariant,
      backgroundColor: selected ? colors.secondaryContainer : colors.surfaceVariant,
      hoverColor: selected ? colors.onSecondaryContainer.withOpacity(0.08) : colors.onSurfaceVariant.withOpacity(0.08),
      focusColor: selected ? colors.onSecondaryContainer.withOpacity(0.12) : colors.onSurfaceVariant.withOpacity(0.12),
      highlightColor:
          selected ? colors.onSecondaryContainer.withOpacity(0.12) : colors.onSurfaceVariant.withOpacity(0.12),
    );
  }

  static ButtonStyle _disabledFilledTonalButtonStyle(bool selected, ColorScheme colors) {
    return IconButton.styleFrom(
      disabledForegroundColor: colors.onSurface.withOpacity(0.38),
      disabledBackgroundColor: colors.onSurface.withOpacity(0.12),
    );
  }

  static ButtonStyle _enabledOutlinedButtonStyle(bool selected, ColorScheme colors) {
    return IconButton.styleFrom(
      backgroundColor: selected ? colors.inverseSurface : null,
      hoverColor: selected ? colors.onInverseSurface.withOpacity(0.08) : colors.onSurfaceVariant.withOpacity(0.08),
      focusColor: selected ? colors.onInverseSurface.withOpacity(0.12) : colors.onSurfaceVariant.withOpacity(0.12),
      highlightColor: selected ? colors.onInverseSurface.withOpacity(0.12) : colors.onSurface.withOpacity(0.12),
      side: BorderSide(color: colors.outline),
    ).copyWith(
      foregroundColor: MaterialStateProperty.resolveWith((states) {
        if (states.contains(MaterialState.selected)) {
          return colors.onInverseSurface;
        }
        if (states.contains(MaterialState.pressed)) {
          return colors.onSurface;
        }
        return null;
      }),
    );
  }

  static ButtonStyle _disabledOutlinedButtonStyle(bool selected, ColorScheme colors) {
    return IconButton.styleFrom(
      disabledForegroundColor: colors.onSurface.withOpacity(0.38),
      disabledBackgroundColor: selected ? colors.onSurface.withOpacity(0.12) : null,
      side: selected ? null : BorderSide(color: colors.outline.withOpacity(0.12)),
    );
  }
}

class CustomToggleIconButton extends StatelessWidget {
  const CustomToggleIconButton({
    super.key,
    required this.toogleController,
    required this.icon,
    required this.selectedIcon,
    this.type = CustomIconButtonType.standard,
  });

  final BehaviorSubject<bool>? toogleController;
  final Widget icon;
  final Widget? selectedIcon;
  final CustomIconButtonType type;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: toogleController,
      builder: (context, snapshot) {
        final isSelected = snapshot.data == true;

        return CustomIconButton(
          onPressed: toogleController != null
              ? () {
                  toogleController?.add(!isSelected);
                }
              : null,
          isSelected: isSelected,
          icon: icon,
          selectedIcon: selectedIcon,
          type: type,
        );
      },
    );
  }
}
