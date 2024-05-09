import 'package:json_annotation/json_annotation.dart';
part 'indexed_route_map_request.g.dart';

@JsonSerializable()
class IndexedRouteMapRequest {
  @JsonKey(includeIfNull: false)
  final bool? onlyDirectRoutes;

  IndexedRouteMapRequest({this.onlyDirectRoutes});

  factory IndexedRouteMapRequest.fromJson(Map<String, dynamic> json) => _$IndexedRouteMapRequestFromJson(json);

  Map<String, dynamic> toJson() => _$IndexedRouteMapRequestToJson(this);
}
