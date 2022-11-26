import 'package:equatable/equatable.dart';

class Geo extends Equatable {
    Geo({
        this.lat,
        this.lng,
    });

    String? lat;
    String? lng;

      @override
      List<Object?> get props => [
        lat,
        lng,
      ];
}