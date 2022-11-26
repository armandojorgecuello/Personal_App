import 'package:equatable/equatable.dart';
import 'package:user_app/core/database/models/user_db.dart';
import 'package:user_app/core/entities/address.dart';
import 'package:user_app/core/entities/company.dart';

class UserData extends Equatable{
    UserData({
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
    Address? address;
    String? phone;
    String? website;
    Company? company;

    UserDb toUserDb() => UserDb(
      email: email,
      name: name,
      phone: phone,
      userId: id,
      userName: username,
      website: website
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



