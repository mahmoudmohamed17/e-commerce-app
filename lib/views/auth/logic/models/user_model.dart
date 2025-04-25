class UserModel {
  final String id;
  final String name;
  final String email;

  UserModel({required this.id, required this.name, required this.email});

  Map<String, dynamic> toJson() {
    return {'user_id': id, 'user_name': name, 'user_email': email};
  }

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(id: json['user_id'], name: json['user_name'], email: json['user_email']);
  }
}
