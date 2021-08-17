class User {
  String? id;
  String? username;
  String? password;

  User({
    this.id,
    this.username,
    this.password,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['_id'] as String,
      username: json['username'] as String,
      password: json['password'] as String,
    );
  }
}
