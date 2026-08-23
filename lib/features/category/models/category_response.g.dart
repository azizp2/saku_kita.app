// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CategoryResponse _$CategoryResponseFromJson(Map<String, dynamic> json) =>
    _CategoryResponse(
      id: json['id'] as String,
      name: json['name'] as String,
      type: json['type'] as String?,
      icon: json['icon'] as String?,
      color: json['color'] as String?,
      isSystem: json['isSystem'] as bool,
      household: json['household'] == null
          ? null
          : HouseholdResponse.fromJson(
              json['household'] as Map<String, dynamic>,
            ),
    );

Map<String, dynamic> _$CategoryResponseToJson(_CategoryResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'type': instance.type,
      'icon': instance.icon,
      'color': instance.color,
      'isSystem': instance.isSystem,
      'household': instance.household,
    };
