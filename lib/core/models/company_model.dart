import 'package:equatable/equatable.dart';
import 'package:user_app/core/entities/company.dart';

import '../../ui/utils/constants/general.dart';

class CompanyModel extends Equatable {
    CompanyModel({
        this.name,
        this.catchPhrase,
        this.bs,
    });

    String? name;
    String? catchPhrase;
    String? bs;

    factory CompanyModel.fromJson(Map<String, dynamic> json) => CompanyModel(
        name: json["name"] ?? kEmptyString,
        catchPhrase: json["catchPhrase"] ?? kEmptyString,
        bs: json["bs"] ?? kEmptyString,
    );

    Company toEntity() => Company(
      bs: bs,
      catchPhrase: catchPhrase,
      name: name,
    );
    
      @override
      List<Object?> get props => [
        name,
        catchPhrase,
        bs,
      ];
    
}
