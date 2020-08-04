import 'package:MobiTest/domain/architecture/architecture.dart';

class MobiEntity extends MobiModel {
  final String name;
  final String age;

  MobiEntity({
    this.name,
    this.age,
  });

  MobiEntity.fromJson(Map<String, dynamic> json)
      : name = json["name"],
        age = json["age"];
}
