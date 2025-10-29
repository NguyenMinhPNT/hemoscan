class UserModel {
  final String id;
  final String name;
  final int age;
  final String? avatarPath;

  UserModel({
    required this.id,
    required this.name,
    required this.age,
    this.avatarPath,
  });

  Map<String, dynamic> toJson() {
    return {'id': id, 'name': name, 'age': age, 'avatarPath': avatarPath};
  }

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'] as String,
      name: json['name'] as String,
      age: json['age'] as int,
      avatarPath: json['avatarPath'] as String?,
    );
  }
}
