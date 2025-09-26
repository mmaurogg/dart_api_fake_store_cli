// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Product _$ProductFromJson(Map<String, dynamic> json) => _Product(
  id: (json['id'] as num?)?.toInt(),
  title: json['title'] as String?,
  price: (json['price'] as num?)?.toDouble(),
  description: json['description'] as String?,
  category: json['category'] as String?,
  image: json['image'] as String?,
  rating: json['rating'] == null
      ? null
      : Rating.fromJson(json['rating'] as Map<String, dynamic>),
);

Map<String, dynamic> _$ProductToJson(_Product instance) => <String, dynamic>{
  'id': instance.id,
  'title': instance.title,
  'price': instance.price,
  'description': instance.description,
  'category': instance.category,
  'image': instance.image,
  'rating': instance.rating,
};

_Rating _$RatingFromJson(Map<String, dynamic> json) => _Rating(
  rate: (json['rate'] as num?)?.toDouble(),
  count: (json['count'] as num?)?.toInt(),
);

Map<String, dynamic> _$RatingToJson(_Rating instance) => <String, dynamic>{
  'rate': instance.rate,
  'count': instance.count,
};
