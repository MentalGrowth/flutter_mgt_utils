import 'dart:math';

import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';

int calculateMaxLines(TextStyle style, double maxHeight) {
  final lineHeight = style.fontSize! * style.height!;

  return max(1, (maxHeight / lineHeight).truncate());
}

double calculateBottomPadding(EdgeInsets viewPadding, EdgeInsets viewInsets, double padding) {
  var bottom = max(padding, viewPadding.bottom);
  if (viewInsets.bottom >= bottom) bottom = padding;

  return bottom;
}
