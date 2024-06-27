// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pagination.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PaginationImpl _$$PaginationImplFromJson(Map<String, dynamic> json) =>
    _$PaginationImpl(
      count: json['count'] as int,
      currentPage: json['currentPage'] as int,
      totalPage: json['totalPage'] as int,
      hasMore: json['hasMore'] as bool,
      hasTmpProperty: json['hasTmpProperty'] as bool?,
    );

Map<String, dynamic> _$$PaginationImplToJson(_$PaginationImpl instance) =>
    <String, dynamic>{
      'count': instance.count,
      'currentPage': instance.currentPage,
      'totalPage': instance.totalPage,
      'hasMore': instance.hasMore,
      'hasTmpProperty': instance.hasTmpProperty,
    };
