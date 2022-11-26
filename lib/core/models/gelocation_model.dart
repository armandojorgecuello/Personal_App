import 'package:equatable/equatable.dart';
import 'package:user_app/core/entities/geolocation.dart';
import 'package:user_app/ui/utils/constants/general.dart';

class GeoModel extends Equatable {
    GeoModel({
        this.lat,
        this.lng,
    });

    String? lat;
    String? lng;

    factory GeoModel.fromJson(Map<String, dynamic> json) => GeoModel(
        lat: json["lat"] ?? kEmptyString,
        lng: json["lng"] ?? kEmptyString,
    );

    Geo toEntity() => Geo(
      lat: lat,
      lng: lng,
    ); 

      @override
      List<Object?> get props => [
        lat,
        lng,
      ];
}