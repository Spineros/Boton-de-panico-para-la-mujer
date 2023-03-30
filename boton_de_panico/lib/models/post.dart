import 'user.dart';

class Post {
  int? id;
  String? address;
  String? location;
  User? user;
  String? user_name;


  Post({
    this.id,
    this.address,
    this.location,
    this.user,
    this.user_name,
  });

// map json to post model

factory Post.fromJson(Map<String, dynamic> json) {
  return Post(
    id: json['id'],
    address: json['address'],
    location: json['location'],
    user: User(
      id: json['user']['id'],
      name: json['user']['name'],
      email: json['user']['email']
    ),
    user_name: json['user_name']
  );
}

}