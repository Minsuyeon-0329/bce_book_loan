class User {
  List<dynamic> user;
  User({
    required this.user
  });
  factory User.fromJson(List<dynamic> json) => User(user: json);

}

class UserModel {
  List<dynamic> usermodel;
  UserModel({required this.usermodel});
  factory UserModel.fromJson(List<dynamic> json) => UserModel(usermodel: json);}


