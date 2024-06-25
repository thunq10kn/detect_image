extension TypeParsing on String {
  /// Parsing String to appropriate types.
  Object parseAppropriate() {
    final parsedInt = int.tryParse(this);
    if (parsedInt != null) return parsedInt;
    final parsedDouble = double.tryParse(this);
    if (parsedDouble != null) return parsedDouble;
    final parsedBool = this == 'true'
        ? true
        : this == 'false'
            ? false
            : null;
    if (parsedBool != null) return parsedBool;
    return this;
  }
}
