import 'package:equatable/equatable.dart';

class UserPost extends Equatable {
    UserPost({
        this.userId,
        this.id,
        this.title,
        this.body,
    });

    int? userId;
    int? id;
    String? title;
    String? body;

    
    @override
    List<Object?> get props => [
      userId,
      id,
      title,
      body
    ];

}
