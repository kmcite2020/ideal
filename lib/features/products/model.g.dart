// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Product _$$_ProductFromJson(Map<String, dynamic> json) => _$_Product(
      id: json['id'] as String,
      name: json['name'] as String,
      model: json['model'] as String,
      brand: $enumDecode(_$BrandEnumMap, json['brand']),
      materialColor:
          const MaterialColorConverter().fromJson(json['materialColor'] as int),
      price: (json['price'] as num).toDouble(),
      stock: json['stock'] as int,
      image: const Uint8ListConverter().fromJson(json['image'] as String),
    );

Map<String, dynamic> _$$_ProductToJson(_$_Product instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'model': instance.model,
      'brand': _$BrandEnumMap[instance.brand]!,
      'materialColor':
          const MaterialColorConverter().toJson(instance.materialColor),
      'price': instance.price,
      'stock': instance.stock,
      'image': const Uint8ListConverter().toJson(instance.image),
    };

const _$BrandEnumMap = {
  Brand.urideal: 'urideal',
  Brand.chinese: 'chinese',
  Brand.pakistani: 'pakistani',
};
