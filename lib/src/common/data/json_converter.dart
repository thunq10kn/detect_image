import 'package:rem_admin/src/common/utils/contants/api.dart';
import 'package:rem_admin/src/common/utils/contants/empty_map.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

class BaseResponseDataConverter
    implements JsonConverter<Map<String, dynamic>, dynamic> {
  const BaseResponseDataConverter();

  @override
  Map<String, dynamic> fromJson(dynamic data) {
    if (data == null) {
      return emptyMap;
    }
    if (data is List) {
      return <String, List<dynamic>>{itemsKey: data};
    }
    return data as Map<String, dynamic>;
  }

  @override
  Map<String, dynamic> toJson(Map<String, dynamic> data) => data;
}
