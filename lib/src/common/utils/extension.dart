import 'package:intl/intl.dart';

import 'dimens.dart';

/// int
extension IntEx on int {
  // Convenience functions for importing this extension.
  void i() => throw Error();

  // Duration
  Duration get seconds => Duration(seconds: this);

  Duration get minutes => Duration(minutes: this);

  Duration get hours => Duration(hours: this);

  Duration get days => Duration(days: this);

  double get toScreenWidth => this * Dimens.screenWidth / 1440;

  double get toScreenHeight => this * Dimens.screenHeight / 800;

  double get toScreenSize => (Dimens.screenWidth > Dimens.screenHeight)
      ? (this * Dimens.screenWidth / 1440)
      : (this * Dimens.screenHeight / 800);
}

// double
extension DoubleEx on double {
  // Convenience functions for importing this extension.
  void i() => throw Error();

  // Duration
  double get toScreenWidth => this * Dimens.screenWidth / 1440;

  double get toScreenHeight => this * Dimens.screenHeight / 2077;

  double get toScreenSize => (Dimens.screenWidth > Dimens.screenHeight)
      ? (this * Dimens.screenWidth / 1440)
      : (this * Dimens.screenHeight / 2077);
}

// 全角と半角は 65248 を足すか引くかだけの差なので、その定数。
// 参考: https://zenn.dev/clay/articles/39208e1f8d442c
const _fullLengthCode = 65248;

/// String
extension StringEx on String {
  // Convenience functions for importing this extension.
  void i() => throw Error();

  String ifIsEmpty(String placeholder) {
    return isEmpty ? placeholder : this;
  }

  bool get isInt => int.tryParse(this).runtimeType == int;

  int? get toInt => int.tryParse(this);

  /// 半角の文字列を全角に変換する
  /// 引数 regexp を渡さなかった場合は、半角英数字を全角に変換する。
  String alphanumericToFullLength([RegExp? regexp]) {
    final regex = regexp ?? RegExp(r'^[a-zA-Z0-9]+$');
    final string = runes.map<String>((rune) {
      final char = String.fromCharCode(rune);
      return regex.hasMatch(char)
          ? String.fromCharCode(rune + _fullLengthCode)
          : char;
    });
    return string.join();
  }

  /// 全角の文字列を半角に変換する
  /// 引数 regexp を渡さなかった場合は、全角英数字を半角に変換する。
  String alphanumericToHalfLength([RegExp? regexp]) {
    final regex = regexp ?? RegExp(r'^[Ａ-Ｚａ-ｚ０-９]+$');
    final string = runes.map<String>((rune) {
      final char = String.fromCharCode(rune);
      return regex.hasMatch(char)
          ? String.fromCharCode(rune - _fullLengthCode)
          : char;
    });
    return string.join();
  }

  /// 不要な空行
  ///   - 冒頭の改行
  ///   - 途中に 3つ以上続く改行
  ///   - 末尾の改行
  /// を取り除く
  String removeUnnecessaryBlankLines() {
    final headBlankLines = RegExp(r'^\n+');
    final blankLines = RegExp(r'\n{3,}');
    final lastBlankLines = RegExp(r'\n+$');
    return replaceAll(headBlankLines, '')
        .replaceAll(blankLines, '\n\n')
        .replaceAll(lastBlankLines, '');
  }

  bool get isValidEmail => RegExp(
          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
      .hasMatch(this);
}

/// DateTime
extension DateTimeEx on DateTime {
  // Convenience functions for importing this extension.
  void i() => throw Error();

  String toFormatString({String format = 'yyyy/MM/dd'}) {
    final formatter = DateFormat(format, 'ja_JP');
    return formatter.format(this);
  }

  bool isSameDate(DateTime other) {
    return year == other.year && month == other.month && day == other.day;
  }

  String timeAgoString() {
    final differenceNow = difference(DateTime.now()).abs();
    if (differenceNow.inMinutes < 1) return '1分前';

    if (differenceNow.inHours < 1) return '${differenceNow.inMinutes}分前';

    if (differenceNow.inDays < 1) return '${differenceNow.inHours}時間前';

    if (differenceNow.inDays == 1) return '昨日';

    return DateFormat('yyyy-MM-dd').format(this);
  }
}

bool sameDay(DateTime a, DateTime b) =>
    a.difference(b).inDays == 0 && a.day == b.day;

/// List
extension ListStringEx on List<String> {
  // Convenience functions for importing this extension.
  void i() => throw Error();

  /// String型の配列の要素をカンマ区切りのString型に編集する
  String toCommaSeparated() {
    final buffer = StringBuffer();
    for (var i = 0; i < length; i++) {
      buffer.write(this[i]);
      if (i < length - 1) {
        buffer.write(', ');
      }
    }
    return buffer.toString();
  }
}
