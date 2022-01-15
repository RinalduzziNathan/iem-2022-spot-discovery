// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SpotCategory _$SpotCategoryFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'SpotCategory',
      json,
      ($checkedConvert) {
        final val = SpotCategory(
          id: $checkedConvert('id', (v) => v as int),
          name: $checkedConvert('name', (v) => v as String?),
          color: $checkedConvert('color', (v) => v as String?),
          icon: $checkedConvert('icon', (v) => v as String?),
          tags: $checkedConvert(
              'tags',
              (v) => (v as List<dynamic>?)
                  ?.map((e) => SpotTag.fromJson(e as Map<String, dynamic>))
                  .toList()),
        );
        return val;
      },
    );

Map<String, dynamic> _$SpotCategoryToJson(SpotCategory instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'color': instance.color,
      'icon': instance.icon,
      'tags': instance.tags?.map((e) => e.toJson()).toList(),
    };
