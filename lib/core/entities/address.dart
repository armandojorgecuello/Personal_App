import 'package:equatable/equatable.dart';
import 'package:user_app/core/entities/geolocation.dart';

class Address extends Equatable{
    Address({
        this.street,
        this.suite,
        this.city,
        this.zipcode,
        this.geo,
    });

    String? street;
    String? suite;
    String? city;
    String? zipcode;
    Geo? geo;
    
      @override
      List<Object?> get props => [
        street,
        suite,
        city,
        zipcode,
        geo,
      ];
}