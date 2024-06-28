import 'dart:convert';

import 'package:hive/hive.dart';
part 'comment_model.g.dart';

@HiveType(typeId: 0)
class Comment extends HiveObject {

  Comment({
    required this.id,
    required this.postId,
    required this.name,
    required this.email,
    required this.body,
  });

  @HiveField(0)
  int id;

  @HiveField(1)
  int postId;

  @HiveField(2)
  String name;

  @HiveField(3)
  String email;

  @HiveField(4)
  String body;

  Comment copyWith({
    int? id,
    int? postId,
    String? name,
    String? email,
    String? body,
  }) {
    return Comment(
      id: id ?? this.id,
      postId: postId ?? this.postId,
      name: name ?? this.name,
      email: email ?? this.email,
      body: body ?? this.body,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'postId': postId,
      'name': name,
      'email': email,
      'body': body,
    };
  }

  factory Comment.fromMap(Map<String, dynamic> map) {
    return Comment(
      id: map['id'] as int,
      postId: map['postId'] as int,
      name: map['name'] as String,
      email: map['email'] as String,
      body: map['body'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Comment.fromJson(String source) => Comment.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Comment(id: $id, postId: $postId, name: $name, email: $email, body: $body)';
  }

  @override
  bool operator ==(covariant Comment other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.postId == postId &&
      other.name == name &&
      other.email == email &&
      other.body == body;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      postId.hashCode ^
      name.hashCode ^
      email.hashCode ^
      body.hashCode;
  }
}
