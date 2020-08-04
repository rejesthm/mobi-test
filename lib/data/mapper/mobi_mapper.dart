import 'package:MobiTest/data/models/mobi_model.dart';
import 'package:MobiTest/domain/architecture/architecture.dart';

class MobiTestMapper extends MobiMapper<MobiEntity> {
  @override
  fromMap(Map<String, dynamic> map) {
    return MobiEntity(
      name: map["name"],
      age: map["Age"],
    );
  }

  @override
  Map<String, dynamic> toMap(object) {
    return null;
  }
}
