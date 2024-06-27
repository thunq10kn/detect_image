import 'package:rem_admin/src/common/data/json_converter.dart';
import 'package:rem_admin/src/common/utils/contants/api.dart';
import 'package:rem_admin/src/common/utils/contants/empty_map.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'base_response_data.freezed.dart';
part 'base_response_data.g.dart';

///
/// - request success
///   When there is no "data" nothing is entered in data
/// {
///   "statusCode": 200, // required
///   "message": "OK", // required
///   "data": [
///      {
///        "id": "bX1w2rRL",
///        "email": "kyouheijp0326@gmail.com"
///      },
///      {
///        "id": "adg2ddf9",
///        "email": "possy.dev@gmail.com"
///      }
///    ]
/// }
/// - request failure
///   If "message" is not specified, "message" will contain "Not Found" etc. and
///   "error" will not contain anything.
/// {
///   "statusCode": 404, // required
///   "message": "The resource is not found.", // required String or List<String>
///   "error": "Not Found"
/// }
///
@freezed
class BaseResponseData with _$BaseResponseData {
  const factory BaseResponseData({
    @Default(500) int statusCode,
    @Default('') String message,
    @Default(emptyMap) @BaseResponseDataConverter() Map<String, dynamic> data,
    @Default('') String error,
  }) = _BaseResponseData;

  factory BaseResponseData.fromJson(Map<String, dynamic> json) =>
      _$BaseResponseDataFromJson(json);

  factory BaseResponseData.fromDynamic(dynamic responseData) {
    final data = _toResponseJson(responseData);
    final baseData = <String, dynamic>{
      'statusCode': data['statusCode'] ?? 500,
      'message': data['message'].toString(),
    };
    // Remove keys that duplicate baseData
    data.removeWhere((key, dynamic value) => baseData.containsKey(key));
    final keys = data.keys;
    if (keys.isEmpty) {
      return BaseResponseData.fromJson(baseData);
    }
    if (keys.length == 1) {
      if (data.keys.first == 'data') {
        return BaseResponseData.fromJson(<String, dynamic>{
          ...baseData,
          'data': data[data.keys.first],
        });
      } else if (data.keys.first == 'error') {
        return BaseResponseData.fromJson(<String, dynamic>{
          ...baseData,
          'error': data[data.keys.first].toString(),
        });
      }
    }
    return BaseResponseData.fromJson(<String, dynamic>{
      ...baseData,
      'data': <String, dynamic>{
        for (final k in data.keys) ...<String, dynamic>{k: data[k]},
      },
    });
  }

  /// Convert dynamic response data to Map<String, dynamic>.
  static Map<String, dynamic> _toResponseJson(dynamic data) {
    if (data == null) {
      return emptyMap;
    }
    if (data is List) {
      return <String, dynamic>{itemsKey: data};
    }
    if (data is Map) {
      return data as Map<String, dynamic>;
    }
    return emptyMap;
  }
}
