class SignupModel {
  String name;
  String username;
  String email;
  String password;
  String profilePictureUrl = '';

  SignupModel({
    required this.name,
    required this.email,
    required this.password,
    required this.username,
  });

  // factory UserModel.fromJson(Map<String, dynamic> json) {
  //   return UserModel(
  //     name: json['name'],
  //     email: json['email'],
  //     password: json['password'],
  //     username: json['username'],
  //     profilePictureUrl: json['profilePictureUrl'],
  //   );
  // }

  Map<String, dynamic> toJson(String url) {
    profilePictureUrl = url;
    return {
      'name': name,
      'username': username,
      'email': email,
      'profilePictureUrl': profilePictureUrl,
    };
  }
}
