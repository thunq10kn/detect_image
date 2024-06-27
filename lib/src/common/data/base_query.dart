import 'package:rem_admin/src/common/data/remove_null_value.dart';

import 'flat.dart';

abstract class BaseQuery {
  Map<String, dynamic> toJson();
}

extension BaseQueryX on BaseQuery {
  Map<String, String> toQuery() {
    final nonNullJson = removeNull(toJson());
    final flatJson = flat(nonNullJson);
    return flatJson.map((key, value) => MapEntry(key, value.toString()));
  }

  Map<String, int> toQueryInt() {
    final nonNullJson = removeNull(toJson());
    final flatJson = flat(nonNullJson);
    return flatJson.map((key, value) => MapEntry(key, value as int));
  }
}
