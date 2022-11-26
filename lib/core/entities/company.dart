import 'package:equatable/equatable.dart';

class Company extends Equatable {
    Company({
        this.name,
        this.catchPhrase,
        this.bs,
    });

    String? name;
    String? catchPhrase;
    String? bs;
    
    @override
    List<Object?> get props => [
      name,
      catchPhrase,
      bs,
    ];
}