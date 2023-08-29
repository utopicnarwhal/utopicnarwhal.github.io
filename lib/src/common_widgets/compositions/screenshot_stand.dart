import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:vector_math/vector_math_64.dart' as vector_math;

/// This widget transforms the [child] that has [aspectRatio] and tries to fit with [BoxFit.contain]
/// the transformed plain into the existing constraints
class ScreenshotStand extends StatelessWidget {
  const ScreenshotStand({
    required this.child,
    required this.aspectRatio,
    this.orientedToTheLeft = true,
    super.key,
  });

  final Widget child;
  final double aspectRatio;
  final bool orientedToTheLeft;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        // Define the transform matrix
        final matrix4 = vector_math.Matrix4.identity()
          ..setEntry(3, 2, 0.0012) // Enable depth perception in the Z direction
          ..rotateZ(25 * (orientedToTheLeft ? 1 : -1) * vector_math.degrees2Radians)
          ..rotateX(-20 * vector_math.degrees2Radians)
          ..rotateY(30 * (orientedToTheLeft ? 1 : -1) * vector_math.degrees2Radians);

        // Define the corners of the original viewport
        final widthDiv2 = (constraints.maxWidth * (aspectRatio > 1 ? 1 : aspectRatio)) / 2;
        final heightDiv2 = (constraints.maxHeight * (aspectRatio < 1 ? 1 : aspectRatio)) / 2;
        List<vector_math.Vector3> corners = [
          vector_math.Vector3(-widthDiv2, -heightDiv2, 0),
          vector_math.Vector3(widthDiv2, -heightDiv2, 0),
          vector_math.Vector3(-widthDiv2, heightDiv2, 0),
          vector_math.Vector3(widthDiv2, heightDiv2, 0),
        ];
        // Calculate the new positions of the corners after transform
        List<vector_math.Vector3> transformedCorners = [];
        for (var corner in corners) {
          transformedCorners.add(matrix4.perspectiveTransform(corner.clone()));
        }

        // Calculate the maximum and minimum coordinates of the transformed corners
        double minX = double.infinity;
        double minY = double.infinity;
        double maxX = double.negativeInfinity;
        double maxY = double.negativeInfinity;

        for (var corner in transformedCorners) {
          if (corner.x < minX) minX = corner.x;
          if (corner.y < minY) minY = corner.y;
          if (corner.x > maxX) maxX = corner.x;
          if (corner.y > maxY) maxY = corner.y;
        }

        // Calculate the scale to apply to fit the viewport
        final scaleY = constraints.maxHeight / (maxY - minY);
        final scaleX = constraints.maxWidth / (maxX - minX);
        final minScaleToFit = [scaleY, scaleX].min;

        return Transform(
          transform: matrix4
            ..translate(-[maxX, minX].average, -[maxY, minY].average) // Translate to the new center
            ..scale(minScaleToFit, minScaleToFit),
          alignment: FractionalOffset.center,
          transformHitTests: false,
          child: AspectRatio(
            aspectRatio: aspectRatio,
            child: child,
          ),
        );
      },
    );
  }
}
