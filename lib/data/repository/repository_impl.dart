import 'package:MobiTest/data/models/mobi_model.dart';
import 'package:MobiTest/data/rest_client.dart';
import 'package:MobiTest/domain/repositories/repository.dart';

class MainRepository extends Repository {
  RestClient restClient;
  MainRepository(this.restClient) {
    restClient = this.restClient;
  }
  Future<MobiEntity> getMobiTestData() async {
    MobiEntity response = await restClient.getMobiTestData();
    return response;
  }
}
