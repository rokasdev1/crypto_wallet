import 'package:json_annotation/json_annotation.dart';
part 'indexed_route_map.g.dart';

@JsonSerializable()
class IndexedRouteMap {
  final List<String> mintKeys;
  final Map<String, List<int>> indexedRouteMap;

  IndexedRouteMap({
    required this.mintKeys,
    required this.indexedRouteMap,
  });

  factory IndexedRouteMap.fromJson(Map<String, dynamic> json) => _$IndexedRouteMapFromJson(json);

  Map<String, dynamic> toJson() => _$IndexedRouteMapToJson(this);
}
