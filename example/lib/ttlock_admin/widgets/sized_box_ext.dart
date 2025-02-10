import 'package:flutter/cupertino.dart';

extension SizedBoxExt on num {
  SizedBox get wsb => SizedBox(
        width: toDouble(),
      );

  SizedBox get hsb => SizedBox(
        height: toDouble(),
      );
}

extension Shrink on Widget {
  SizedBox get zero => SizedBox.shrink();
}
