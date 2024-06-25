extension StringExt on String {
  String formatNullOfString() {
    return trim() == "null" ? "" : this;
  }
}

extension StringNullExt on String? {
  bool checkNullOfString() {
    return this?.trim() != null &&
        this?.trim() != "null" &&
        this?.trim().isNotEmpty == true;
  }

  int formatNumber() {
    return (this?.trim() == null ||
            this?.trim().isEmpty == true ||
            this?.trim() == "null")
        ? 0
        : int.parse(this!.trim());
  }
}
