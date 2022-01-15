import 'package:json_annotation/json_annotation.dart';

part 'tag.g.dart';

@JsonSerializable(checked: true)
class SpotTag {
  int id;
  String? name;

  SpotTag({required this.id, this.name});

  factory SpotTag.fromJson(Map<String, dynamic> json) =>
      _$SpotTagFromJson(json);

  Map<String, dynamic> toJson() => _$SpotTagToJson(this);
}
