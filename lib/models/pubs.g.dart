// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pubs.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Pubs _$PubsFromJson(Map<String, dynamic> json) {
  return Pubs(
    id: json['id'] as int,
    name: json['name'] as String,
    address: json['address'] as String,
    picture: json['picture'] == null
        ? null
        : PubPicture.fromJson(json['picture'] as Map<String, dynamic>),
    avgPrice: json['avgPrice'] as int,
  );
}

Map<String, dynamic> _$PubsToJson(Pubs instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'address': instance.address,
      'picture': instance.picture?.toJson(),
      'avgPrice': instance.avgPrice,
    };
