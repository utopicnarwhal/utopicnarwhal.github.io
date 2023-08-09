import 'package:portfolio/src/global_widgets/portfolio_theme/portfolio_theme.dart';
import 'package:portfolio/src/global_widgets/indicators/loading_widget.dart';
import 'package:flutter/material.dart';

enum CustomButtonType {
  surface,
  filled,
  tonal,
  outlined,
  text,
}

enum CustomButtonSize { large, regular, small }

enum CustomButtonColor { primary, card, destructive }

const _buttonSwitchingAnimationDuration = Duration(milliseconds: 150);

class CustomButton extends StatelessWidget {
  const CustomButton({
    required this.onPressed,
    required this.text,
    this.tooltip,
    this.leading,
    this.trailing,
    this.color = CustomButtonColor.primary,
    this.applyBGColorWhenOutlinedOrDisabled = true,
    this.isLoading = false,
    this.type = CustomButtonType.filled,
    this.surfaceLevel = 0,
    this.margin,
    this.customContentPadding,
    this.size = CustomButtonSize.regular,
    this.fullWidth = false,
    this.onLongPress,
    Key? key,
  }) : super(key: key);

  final String text;
  final String? tooltip;
  final VoidCallback? onPressed;
  final VoidCallback? onLongPress;
  final Widget? leading;
  final Widget? trailing;
  final CustomButtonColor color;
  final bool applyBGColorWhenOutlinedOrDisabled;
  final bool isLoading;
  final CustomButtonType type;
  final CustomButtonSize size;
  final EdgeInsets? customContentPadding;
  final bool fullWidth;

  /// Only works with Contained type of button
  final int surfaceLevel;
  final EdgeInsets? margin;

  @override
  Widget build(BuildContext context) {
    final textWidget = Text(
      text,
      style: _getTextStyle(context)?.copyWith(color: _buttonSecondaryColor(context, type)),
      textAlign: TextAlign.center,
    );

    late Widget result;
    result = textWidget;

    result = _buildButtonFromType(context, result, isLoading);

    result = ConstrainedBox(
      constraints: BoxConstraints(
        minWidth: fullWidth ? double.infinity : kMinInteractiveDimension,
        minHeight: _getMinHeight(),
      ),
      child: result,
    );

    if (margin != null) {
      result = Padding(
        padding: margin!,
        child: result,
      );
    }
    return result;
  }

  TextStyle? _getTextStyle(BuildContext context) {
    switch (size) {
      case CustomButtonSize.large:
        return Theme.of(context).textTheme.labelLarge;
      case CustomButtonSize.regular:
        return Theme.of(context).textTheme.labelMedium;
      case CustomButtonSize.small:
        return Theme.of(context).textTheme.labelSmall;
    }
  }

  double _getMinHeight() {
    switch (size) {
      case CustomButtonSize.large:
        return 48;
      case CustomButtonSize.regular:
        return 40;
      case CustomButtonSize.small:
        return 32;
    }
  }

  EdgeInsets _getMinInternalPadding() {
    if (customContentPadding != null) {
      return customContentPadding!;
    }
    switch (size) {
      case CustomButtonSize.large:
        return const EdgeInsets.symmetric(horizontal: 24, vertical: 18);
      case CustomButtonSize.regular:
        return const EdgeInsets.symmetric(horizontal: 16, vertical: 10);
      case CustomButtonSize.small:
        return const EdgeInsets.symmetric(horizontal: 12, vertical: 6);
    }
  }

  Color? _buttonPrimaryColor(BuildContext context, CustomButtonType type) {
    switch (color) {
      case CustomButtonColor.primary:
        return type != CustomButtonType.outlined ? null : Theme.of(context).colorScheme.primary;
      case CustomButtonColor.destructive:
        return Theme.of(context).colorScheme.error;
      case CustomButtonColor.card:
        if (type == CustomButtonType.outlined || type == CustomButtonType.text) {
          return Colors.white;
        }
        return Theme.of(context).cardColor;
    }
  }

  Color? _buttonSecondaryColor(BuildContext context, CustomButtonType type) {
    if (color == CustomButtonColor.destructive) {
      return Theme.of(context).colorScheme.onError;
    }
    if (type == CustomButtonType.filled) {
      return color == CustomButtonColor.card
          ? Theme.of(context).colorScheme.primary
          : Theme.of(context).colorScheme.onPrimary;
    }
    if (type == CustomButtonType.tonal) {
      return Theme.of(context).colorScheme.onPrimaryContainer;
    }
    return null;
  }

  double _loadingWidgetSize() {
    switch (size) {
      case CustomButtonSize.large:
        return 24;
      case CustomButtonSize.regular:
        return 20;
      case CustomButtonSize.small:
        return 14;
    }
  }

  Widget _buildLoadingWidget() {
    return Builder(
      builder: (context) {
        return LoadingWidget(
          visible: isLoading,
          color: IconTheme.of(context).color,
          size: _loadingWidgetSize(),
          strokeWidth: size == CustomButtonSize.small ? 3 : 5,
        );
      },
    );
  }

  Widget _buildButtonFromType(BuildContext context, Widget child, bool isLoading) {
    final buttonPrimaryColor = _buttonPrimaryColor(context, type);
    final buttonOnPressed = isLoading ? () {} : onPressed;
    final buttonOnLongPress = isLoading ? null : onLongPress;
    Widget? buttonLeading;
    Widget? buttonTrailing;

    if (leading != null) {
      buttonLeading = Padding(
        padding: const EdgeInsets.only(right: 8),
        child: Stack(
          alignment: Alignment.center,
          children: [
            _buildLoadingWidget(),
            // Button should save the size even when the button label is replaced with loading indicator
            AnimatedOpacity(
              opacity: isLoading ? 0 : 1,
              duration: _buttonSwitchingAnimationDuration,
              child: leading!,
            ),
          ],
        ),
      );
    }
    if (trailing != null) {
      buttonTrailing = Padding(
        padding: const EdgeInsets.only(left: 8),
        child: Stack(
          alignment: Alignment.center,
          children: [
            if (leading == null) _buildLoadingWidget(),
            // Button should save the size even when the button label is replaced with loading indicator
            AnimatedOpacity(
              opacity: (isLoading && leading == null) ? 0 : 1,
              duration: _buttonSwitchingAnimationDuration,
              child: trailing!,
            ),
          ],
        ),
      );
    }
    Widget buttonChild = Builder(
      // We need the Builder widget to get the corrent IconTheme.of(context)
      builder: (context) {
        return IconTheme(
          data: IconTheme.of(context).copyWith(size: _loadingWidgetSize()),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (buttonLeading != null) buttonLeading,
              // Button should save the size even when the button label is replaced with loading indicator
              Flexible(
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    // Show loading widget in the center in case if there are no trailing and leading widgets
                    if (leading == null && trailing == null) _buildLoadingWidget(),
                    // Hide the label text in case if there are no trailing and leading widgets
                    AnimatedOpacity(
                      opacity: isLoading && leading == null && trailing == null ? 0 : 1,
                      duration: _buttonSwitchingAnimationDuration,
                      child: child,
                    ),
                  ],
                ),
              ),
              if (buttonTrailing != null) buttonTrailing,
            ],
          ),
        );
      },
    );
    final internalPadding = customContentPadding ?? _getMinInternalPadding();
    final disabledBackgroundColor = Color.alphaBlend(
      Theme.of(context).disabledColor.withOpacity(0.12),
      Theme.of(context).cardColor,
    );

    switch (type) {
      case CustomButtonType.surface:
        final buttonStyle = ElevatedButton.styleFrom(
          backgroundColor: buttonPrimaryColor,
          foregroundColor: _buttonSecondaryColor(context, type),
          disabledBackgroundColor: applyBGColorWhenOutlinedOrDisabled ? disabledBackgroundColor : null,
          elevation: surfaceLevelToElevation(surfaceLevel),
          shape: const StadiumBorder(),
          padding: internalPadding,
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          visualDensity: VisualDensity.compact,
          surfaceTintColor: buttonPrimaryColor != null ? Colors.transparent : null,
        );

        return ElevatedButton(
          style: buttonStyle,
          onPressed: buttonOnPressed,
          onLongPress: buttonOnLongPress,
          child: buttonChild,
        );
      case CustomButtonType.filled:
        final buttonStyle = FilledButton.styleFrom(
          backgroundColor: buttonPrimaryColor,
          disabledBackgroundColor: applyBGColorWhenOutlinedOrDisabled ? disabledBackgroundColor : null,
          foregroundColor: _buttonSecondaryColor(context, type),
          shape: const StadiumBorder(),
          padding: internalPadding,
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          visualDensity: VisualDensity.compact,
        );

        return FilledButton(
          style: buttonStyle,
          onPressed: buttonOnPressed,
          onLongPress: buttonOnLongPress,
          child: buttonChild,
        );
      case CustomButtonType.tonal:
        final buttonStyle = FilledButton.styleFrom(
          backgroundColor: buttonPrimaryColor,
          foregroundColor: _buttonSecondaryColor(context, type),
          disabledBackgroundColor: applyBGColorWhenOutlinedOrDisabled ? disabledBackgroundColor : null,
          shape: const StadiumBorder(),
          padding: internalPadding,
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          visualDensity: VisualDensity.compact,
        );

        return FilledButton.tonal(
          style: buttonStyle,
          onPressed: buttonOnPressed,
          onLongPress: buttonOnLongPress,
          child: buttonChild,
        );
      case CustomButtonType.outlined:
        Color? outlineColor = buttonPrimaryColor;
        if (buttonOnPressed == null) {
          outlineColor = Theme.of(context).disabledColor;
        }
        final buttonStyle = OutlinedButton.styleFrom(
          foregroundColor: buttonPrimaryColor,
          shape: const StadiumBorder(),
          side: outlineColor != null
              ? BorderSide(
                  color: outlineColor,
                  width: size == CustomButtonSize.small ? 1 : 2,
                )
              : null,
          padding: internalPadding,
          splashFactory: InkSplash.splashFactory,
          disabledBackgroundColor: applyBGColorWhenOutlinedOrDisabled ? disabledBackgroundColor : null,
          backgroundColor: applyBGColorWhenOutlinedOrDisabled && color != CustomButtonColor.card
              ? Theme.of(context).cardColor
              : null,
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          visualDensity: VisualDensity.compact,
        );

        return OutlinedButton(
          style: buttonStyle,
          onPressed: buttonOnPressed,
          onLongPress: buttonOnLongPress,
          child: buttonChild,
        );
      case CustomButtonType.text:
        final buttonStyle = TextButton.styleFrom(
          foregroundColor: buttonPrimaryColor,
          disabledBackgroundColor: applyBGColorWhenOutlinedOrDisabled ? disabledBackgroundColor : null,
          shape: const StadiumBorder(),
          padding: internalPadding,
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          visualDensity: VisualDensity.compact,
        );

        return TextButton(
          style: buttonStyle,
          onPressed: buttonOnPressed,
          onLongPress: buttonOnLongPress,
          child: buttonChild,
        );
    }
  }
}
