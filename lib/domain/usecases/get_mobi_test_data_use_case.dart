import 'package:MobiTest/data/models/mobi_model.dart';
import 'package:MobiTest/domain/repositories/repository.dart';

class GetMobiTestDataUseCase {
  final Repository repository;

  GetMobiTestDataUseCase(this.repository);

  Future<MobiEntity> execute() {
    return repository.getMobiTestData();
  }
}
