import 'dart:convert';

RegisterModel registerModelFromJson(String str) => RegisterModel.fromJson(json.decode(str));

String registerModelToJson(RegisterModel data) => json.encode(data.toJson());

class RegisterModel {
  RegisterModel({
    required this.email,
    required this.bceName,
    required this.bceDigit,
    required this.password,
  });

  String email;
  String bceName;
  int bceDigit;
  String password;

  factory RegisterModel.fromJson(Map<String, dynamic> json) => RegisterModel(
    email: json["email"],
    bceName: json["bce_name"],
    bceDigit: json["bce_digit"],
    password: json["password"],
  );

  Map<String, dynamic> toJson() => {
    "email": email,
    "bce_name": bceName,
    "bce_digit": bceDigit,
    "password": password,
  };
}
