
import 'package:equatable/equatable.dart';
import 'package:user_app/core/entities/address.dart';
import 'package:user_app/core/models/gelocation_model.dart';
import 'package:user_app/ui/utils/constants/general.dart';

class AddressModel extends Equatable{
    AddressModel({
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
    GeoModel? geo;

    factory AddressModel.fromJson(Map<String, dynamic> json) => AddressModel(
        street: json["street"] ?? kEmptyString,
        suite: json["suite"] ?? kEmptyString,
        city: json["city"] ?? kEmptyString,
        zipcode: json["zipcode"] ?? kEmptyString,
        geo: json["geo"] != null ? GeoModel.fromJson(json["geo"]) : null,
    );
    
    Address toEntity() => Address(
      city: city,
      geo: geo?.toEntity(),
      street: street,
      suite: suite,
      zipcode: zipcode,

    );

      @override
      List<Object?> get props => [
        street,
        suite,
        city,
        zipcode,
        geo,
      ];

}
