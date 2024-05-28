class UserModel {
  dynamic id;
  String? name;
  String? surname;
  String email;

  UserModel({
    this.id,
    this.name,
    this.surname,
    required this.email,
  });

  factory UserModel.fromMap(Map<String, dynamic> map, {dynamic key}) {
    return UserModel(
      id: key ?? map["id"],
      name: map['name'],
      surname: map['surname'],
      email: map['email'],
    );
  }

  Map<String, dynamic> toMap({dynamic key}) {
    return {
      "id": key ?? id,
      "name": name,
      "surname": surname,
      "email": email,
    };
  }
}
