// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'indexed_route_map.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

IndexedRouteMap _$IndexedRouteMapFromJson(Map<String, dynamic> json) =>
    IndexedRouteMap(
      mintKeys:
          (json['mintKeys'] as List<dynamic>).map((e) => e as String).toList(),
      indexedRouteMap: (json['indexedRouteMap'] as Map<String, dynamic>).map(
        (k, e) =>
            MapEntry(k, (e as List<dynamic>).map((e) => e as int).toList()),
      ),
    );

Map<String, dynamic> _$IndexedRouteMapToJson(IndexedRouteMap instance) =>
    <String, dynamic>{
      'mintKeys': instance.mintKeys,
      'indexedRouteMap': instance.indexedRouteMap,
    };
