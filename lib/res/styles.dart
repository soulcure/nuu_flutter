import 'package:flutter/widgets.dart';

import 'dimens.dart';

class TextStyles {
  static TextStyle listTitle = TextStyle(
    fontSize: Dimens.font_sp16,
    color: Color(0xFF333333),
    fontWeight: FontWeight.bold,
  );
  static TextStyle listContent = TextStyle(
    fontSize: Dimens.font_sp14,
    color: Color(0xFF666666),
  );
  static TextStyle listExtra = TextStyle(
    fontSize: Dimens.font_sp12,
    color: Color(0xFF999999),
  );

  static TextStyle homeTitle = TextStyle(
      fontSize: Dimens.font_sp22,
      color: Color(0xFF606263),
      fontWeight: FontWeight.w700);
}

class Decorations {
  static Decoration bottom = BoxDecoration(
      border:
          Border(bottom: BorderSide(width: 0.33, color: Color(0xffe5e5e5))));
}

/// 间隔
class Gaps {
  /// 水平间隔
  static Widget hGap5 = new SizedBox(width: Dimens.gap_dp5);
  static Widget hGap10 = new SizedBox(width: Dimens.gap_dp10);
  static Widget hGap15 = new SizedBox(width: Dimens.gap_dp15);

  /// 垂直间隔
  static Widget vGap5 = new SizedBox(height: Dimens.gap_dp5);
  static Widget vGap10 = new SizedBox(height: Dimens.gap_dp10);
  static Widget vGap15 = new SizedBox(height: Dimens.gap_dp15);
}
