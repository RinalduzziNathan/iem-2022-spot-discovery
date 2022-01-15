// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tag.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SpotTag _$SpotTagFromJson(Map<String, dynamic> json) => $checkedCreate(
      'SpotTag',
      json,
      ($checkedConvert) {
        final val = SpotTag(
          id: $checkedConvert('id', (v) => v as int),
          name: $checkedConvert('name', (v) => v as String?),
        );
        return val;
      },
    );

Map<String, dynamic> _$SpotTagToJson(SpotTag instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };
