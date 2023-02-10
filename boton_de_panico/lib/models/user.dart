class RegistrationApiResponse {
  RegistrationApiResponse({
    required this.id,
    required this.name,
    required this.email,
    required this.phoneNumber,
    required this.tipodocumento,
    required this.documento,
    required this.sexo,
    required this.tipopoblacion,
    required this.password,
    required this.userData,
  });

  String id;
  String name;
  String email;
  String phoneNumber;
  String tipodocumento;
  String documento;
  String sexo;
  String tipopoblacion;
  String password;
  //UserData userData;
  User? userData;

  factory RegistrationApiResponse.fromJson(Map<String, dynamic> json) =>
      RegistrationApiResponse(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        phoneNumber: json["phoneNumber"],
        tipodocumento: json["tipodocumento"],
        documento: json["documento"],
        sexo: json["sexo"],
        tipopoblacion: json["tipopoblacion"],
        password: json["password"],
        userData: json["UserData"] == null
            ? null
            : User.fromJson(json["UserData"] as Map<String, dynamic>),
      );
}

class User {
  int id;
  String? name;
  String? email;
  String? phoneNumber;
  String? tipodocumento;
  String? documento;
  String? sexo;
  String? tipopoblacion;
  String? password;
  String? token;

  User(
      {required this.id,
      this.name,
      this.email,
      this.phoneNumber,
      this.tipodocumento,
      this.documento,
      this.sexo,
      this.tipopoblacion,
      this.password,
      this.token});

  // function to convert json data to user model
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
        id: json['user']['id'] as int,
        name: json['user']['name'],
        email: json['user']['email'],
        phoneNumber: json['user']['phoneNumber'],
        tipodocumento: json['user']['tipodocumento'],
        documento: json['user']['documento'],
        sexo: json['user']['sexo'],
        tipopoblacion: json['user']['tipopoblacion'],
        password: json['user']['password'],
        token: json['token']);
  }
}
