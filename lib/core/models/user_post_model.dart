import 'package:equatable/equatable.dart';
import 'package:user_app/core/entities/user_post.dart';
import 'package:user_app/ui/utils/constants/general.dart';

class UserPostModel extends Equatable {
    UserPostModel({
        this.userId,
        this.id,
        this.title,
        this.body,
    });

    int? userId;
    int? id;
    String? title;
    String? body;

    factory UserPostModel.fromJson(Map<String, dynamic> json) => UserPostModel(
        userId: ((json["userId"] ?? 0 ) as num).toInt(),
        id: ((json["id"] ?? 0 ) as num).toInt(),
        title: json["title"] ?? kEmptyString,
        body: json["body"] ?? kEmptyString,
    );


    UserPost toEntity() => UserPost(
      body: body,
      id: id,
      title: title,
      userId: userId,
    );
    
    @override
    List<Object?> get props => [
      userId,
      id,
      title,
      body
    ];

}
