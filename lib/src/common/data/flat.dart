
import 'list_to_map.dart';

/// Recursively expands the entries whose value is Map from the Map
/// and removes the original entries.
Map<String, Object?> flat(
  Map<String, Object?> target, {
  bool safe = false,
}) {
  final result = <String, Object?>{};

  void step(Map<String, Object?> obj) {
    obj.forEach((key, value) {
      if (value is Map<String, Object?>) {
        return step(value);
      }
      if (value is List && !safe) {
        return step(listToMap(value));
      }
      result[key] = value;
    });
  }

  step(target);

  return result;
}
