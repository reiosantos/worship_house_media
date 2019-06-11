import 'package:json_annotation/json_annotation.dart';

part 'menu.g.dart';

@JsonSerializable()
class Menu extends Object {
  Menu({this.menu});

  factory Menu.fromJson(Map<String, dynamic> parsedJson) =>
      _$MenuFromJson(parsedJson);

  List<String> menu;
}
