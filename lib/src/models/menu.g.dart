// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'menu.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Menu _$MenuFromJson(Map json) {
  return $checkedNew('Menu', json, () {
    final val = Menu(
        menu: $checkedConvert(json, 'menu',
            (v) => (v as List)?.map((e) => e as String)?.toList()));
    return val;
  });
}

Map<String, dynamic> _$MenuToJson(Menu instance) =>
    <String, dynamic>{'menu': instance.menu};
