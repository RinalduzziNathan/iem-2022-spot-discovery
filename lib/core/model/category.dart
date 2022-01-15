import 'package:iem_2022_spot_discovery/core/model/tag.dart';
import 'package:json_annotation/json_annotation.dart';

part 'category.g.dart';

@JsonSerializable(checked: true, explicitToJson: true)
class SpotCategory {
  int id;
  String? name;
  String? color;
  String? icon;
  List<SpotTag>? tags;

  SpotCategory({required this.id, this.name, this.color, this.icon, this.tags});

  factory SpotCategory.fromJson(Map<String, dynamic> json) =>
      _$SpotCategoryFromJson(json);

  Map<String, dynamic> toJson() => _$SpotCategoryToJson(this);
}
