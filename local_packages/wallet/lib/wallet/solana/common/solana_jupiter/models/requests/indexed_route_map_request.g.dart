// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'indexed_route_map_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

IndexedRouteMapRequest _$IndexedRouteMapRequestFromJson(
        Map<String, dynamic> json) =>
    IndexedRouteMapRequest(
      onlyDirectRoutes: json['onlyDirectRoutes'] as bool?,
    );

Map<String, dynamic> _$IndexedRouteMapRequestToJson(
    IndexedRouteMapRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('onlyDirectRoutes', instance.onlyDirectRoutes);
  return val;
}
