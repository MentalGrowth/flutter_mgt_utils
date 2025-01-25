import 'dart:math';

import 'package:flutter/rendering.dart';

Size calculateTextSize(
  String text, {
  required TextStyle style,
  required TextDirection textDirection,
  required TextScaler textScaler,
  int maxLines = 1,
  double minWidth = 0,
  double maxWidth = double.infinity,
}) {
  final textPainter = TextPainter(
    text: TextSpan(
      text: text,
      style: style,
    ),
    textDirection: textDirection,
    textScaler: textScaler,
    maxLines: maxLines,
  )..layout(
      minWidth: minWidth,
      maxWidth: maxWidth,
    );
  final size = textPainter.size;
  return size;
}

int calculateMaxLines(
  String text, {
  required TextStyle style,
  required TextDirection textDirection,
  required TextScaler textScaler,
  required BoxConstraints constraints,
}) {
  final size = calculateTextSize(
    text,
    style: style,
    textDirection: textDirection,
    textScaler: textScaler,
  );
  final maxLines = calculateMaxLinesFromSize(
    size: size,
    constraints: constraints,
  );
  return maxLines;
}

int calculateMaxLinesFromSize({
  required Size size,
  required BoxConstraints constraints,
}) {
  final maxLines = max(1, (constraints.biggest.height / size.height).floor());
  return maxLines;
}

double calculateBottomPadding(
  double padding, {
  required EdgeInsets viewPadding,
  required EdgeInsets viewInsets,
}) {
  var bottom = max(padding, viewPadding.bottom);
  if (viewInsets.bottom >= bottom) bottom = padding;
  return bottom;
}
