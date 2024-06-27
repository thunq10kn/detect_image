/// 再帰的に Map から value が null の entry を削除する。
Map<String, Object?> removeNull(Map<String, Object?> json) {
  json.removeWhere((key, value) {
    if (value == null) return true;
    if (value is Map<String, Object?>) removeNull(value);
    return false;
  });
  return json;
}
