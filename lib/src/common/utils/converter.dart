import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:intl/intl.dart';
import 'package:rem_admin/src/common/utils/enum.dart';

class DateTimeConverter implements JsonConverter<DateTime, String> {
  const DateTimeConverter();

  final String format = "yyyy-MM-dd'T'HH:mm:ss.SSSZ";

  @override
  DateTime fromJson(String date) =>
      DateFormat(format).parse(date, true).toLocal();

  @override
  String toJson(DateTime date) => DateFormat(format).format(date);
}


class DateTimeOrNullConverter implements JsonConverter<DateTime?, String?> {
  const DateTimeOrNullConverter();

  final String format = "yyyy-MM-dd'T'HH:mm:ss.SSSZ";

  @override
  DateTime? fromJson(String? date) =>
      date != null ? DateFormat(format).parse(date, true).toLocal() : null;

  @override
  String? toJson(DateTime? date) =>
      date != null ? DateFormat(format).format(date) : null;
}

class DateConverter implements JsonConverter<DateTime, String> {
  const DateConverter([this.format = "yyyy-MM-dd"]);

  final String format;

  @override
  DateTime fromJson(String date) =>
      DateFormat(format).parse(date, true).toLocal();

  @override
  String toJson(DateTime date) => DateFormat(format).format(date);
}

class DateOrNullConverter implements JsonConverter<DateTime?, String?> {
  const DateOrNullConverter();

  final String format = "yyyy-MM-dd";

  @override
  DateTime? fromJson(String? date) =>
      date != null ? DateFormat(format).parse(date, true).toLocal() : null;

  @override
  String? toJson(DateTime? date) =>
      date != null ? DateFormat(format).format(date) : null;
}

class TypeMessageConverter implements JsonConverter<TypeMessage, String?> {
  const TypeMessageConverter();

  @override
  TypeMessage fromJson(String? key) => TypeMessage.parse(key);

  @override
  String? toJson(TypeMessage type) => type.key;
}

class TypeActionConverter implements JsonConverter<TypeAction, String?> {
  const TypeActionConverter();

  @override
  TypeAction fromJson(String? key) => TypeAction.parse(key);

  @override
  String? toJson(TypeAction type) => type.key;
}

class ConversationStatusConverter
    implements JsonConverter<ConversationStatus, String?> {
  const ConversationStatusConverter();

  @override
  ConversationStatus fromJson(String? key) => ConversationStatus.parse(key);

  @override
  String? toJson(ConversationStatus type) => type.key;
}

class StoreStatusConverter implements JsonConverter<StoreStatus, String> {
  const StoreStatusConverter();

  @override
  StoreStatus fromJson(String key) => StoreStatus.parse(key);

  @override
  String toJson(StoreStatus type) => type.key;
}

class StoreStatusOrNullConverter
    implements JsonConverter<StoreStatus?, String?> {
  const StoreStatusOrNullConverter();

  @override
  StoreStatus? fromJson(String? key) => StoreStatus.parseOrNull(key);

  @override
  String? toJson(StoreStatus? type) => type?.key;
}
