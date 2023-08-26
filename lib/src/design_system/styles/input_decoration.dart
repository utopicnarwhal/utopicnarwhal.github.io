part of 'portfolio_theme.dart';

InputDecorationTheme _inputDecorationTheme({
  required bool isDark,
  required ColorScheme colorScheme,
  required TextTheme textTheme,
}) {
  return InputDecorationTheme(
    border: const OutlineInputBorder(borderSide: BorderSide(width: 1)),
    floatingLabelAlignment: FloatingLabelAlignment.start,
    floatingLabelBehavior: FloatingLabelBehavior.auto,
    floatingLabelStyle: TextStyle(fontSize: textTheme.bodyLarge?.fontSize, height: 0.8),
    labelStyle: TextStyle(fontSize: textTheme.bodyLarge?.fontSize, height: textTheme.bodyLarge?.height),
    hintStyle: TextStyle(fontSize: textTheme.bodyLarge?.fontSize, height: textTheme.bodyLarge?.height),
    prefixStyle: TextStyle(fontSize: textTheme.bodyLarge?.fontSize),
    suffixStyle: TextStyle(fontSize: textTheme.bodyLarge?.fontSize),
    contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
    alignLabelWithHint: false,
    filled: true,
    fillColor: isDark ? Colors.grey.shade900 : colorScheme.surface,
  );
}

class CustomInputBorder extends InputBorder {
  const CustomInputBorder({
    BorderSide borderSide = const BorderSide(),
    this.borderRadius = const BorderRadius.all(Radius.circular(8)),
  }) : super(borderSide: borderSide);

  final BorderRadius borderRadius;

  @override
  bool get isOutline => false;

  @override
  CustomInputBorder copyWith({BorderSide? borderSide, BorderRadius? borderRadius}) {
    return CustomInputBorder(
      borderSide: borderSide ?? this.borderSide,
      borderRadius: borderRadius ?? this.borderRadius,
    );
  }

  @override
  EdgeInsetsGeometry get dimensions {
    return EdgeInsets.all(borderSide.width);
  }

  @override
  InputBorder scale(double t) {
    return CustomInputBorder(borderSide: borderSide.scale(t), borderRadius: borderRadius);
  }

  @override
  Path getInnerPath(Rect rect, {TextDirection? textDirection}) {
    return Path()
      ..addRect(Rect.fromLTWH(rect.left, rect.top, rect.width, math.max(0.0, rect.height - borderSide.width)));
  }

  @override
  Path getOuterPath(Rect rect, {TextDirection? textDirection}) {
    return Path()..addRRect(borderRadius.resolve(textDirection).toRRect(rect).inflate(borderSide.width / 2));
  }

  @override
  ShapeBorder? lerpFrom(ShapeBorder? a, double t) {
    if (a is CustomInputBorder) {
      return CustomInputBorder(
        borderSide: BorderSide.lerp(a.borderSide, borderSide, t),
        borderRadius: BorderRadius.lerp(a.borderRadius, borderRadius, t)!,
      );
    }
    return super.lerpFrom(a, t);
  }

  @override
  ShapeBorder? lerpTo(ShapeBorder? b, double t) {
    if (b is CustomInputBorder) {
      return CustomInputBorder(
        borderSide: BorderSide.lerp(borderSide, b.borderSide, t),
        borderRadius: BorderRadius.lerp(borderRadius, b.borderRadius, t)!,
      );
    }
    return super.lerpTo(b, t);
  }

  @override
  void paint(
    Canvas canvas,
    Rect rect, {
    double? gapStart,
    double gapExtent = 0.0,
    double gapPercentage = 0.0,
    TextDirection? textDirection,
  }) {
    if (borderRadius.bottomLeft != Radius.zero || borderRadius.bottomRight != Radius.zero) {
      canvas.clipPath(getOuterPath(rect, textDirection: textDirection));
    }
    canvas.drawRRect(borderRadius.toRRect(rect), borderSide.toPaint());
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other.runtimeType != runtimeType) return false;
    return other is InputBorder && other.borderSide == borderSide;
  }

  @override
  int get hashCode => borderSide.hashCode ^ borderRadius.hashCode;
}
