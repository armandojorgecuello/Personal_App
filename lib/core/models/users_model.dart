import 'package:equatable/equatable.dart';
import 'package:user_app/core/entities/user_data.dart';
import 'package:user_app/core/models/address_model.dart';
import 'package:user_app/core/models/company_model.dart';
import 'package:user_app/ui/utils/constants/general.dart';

class UserDataModel extends Equatable{
    UserDataModel({
        this.id,
        this.name,
        this.username,
        this.email,
        this.address,
        this.phone,
        this.website,
        this.company,
    });

    int? id;
    String? name;
    String? username;
    String? email;
    AddressModel? address;
    String? phone;
    String? website;
    CompanyModel? company;

    factory UserDataModel.fromJson(Map<String, dynamic> json) => UserDataModel(
        id: json["id"] ?? kEmptyString ,
        name: json["name"] ?? kEmptyString ,
        username: json["username"] ?? kEmptyString ,
        email: json["email"] ?? kEmptyString ,
        address: json["address"] != null ? AddressModel.fromJson(json["address"]) : null,
        phone: json["phone"] ?? kEmptyString,
        website: json["website"] ?? kEmptyString,
        company: json["company"] != null ?  CompanyModel.fromJson(json["company"]) : null,
    );
    
    UserData toEntity() => UserData(
      address: address?.toEntity(),
      company: company?.toEntity(),
      email:  email,
      id: id,
      name: name ,
      phone: phone, 
      username: username,
      website: website,
    );

      @override
      
      List<Object?> get props => [
        id,
        name,
        username,
        email,
        address,
        phone,
        website,
        company,
      ];

    
}



