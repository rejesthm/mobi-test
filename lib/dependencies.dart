import 'package:MobiTest/data/repository/repository_impl.dart';
import 'package:MobiTest/data/rest_client.dart';
import 'package:MobiTest/domain/repositories/repository.dart';
import 'package:MobiTest/domain/usecases/get_mobi_test_data_use_case.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

Future<void> init() async {
  Dio dio = getDio();

  var restClient = RestClient(dio);
  Repository repository = MainRepository(
    restClient,
  );

  GetIt.I.registerSingleton<Repository>(repository);
  GetIt.I.registerSingleton<RestClient>(restClient);
  GetIt.I.registerSingleton<Dio>(dio);

  GetIt.I.registerLazySingleton<GetMobiTestDataUseCase>(
      () => GetMobiTestDataUseCase(repository));
}

Dio getDio() {
  BaseOptions options = new BaseOptions(
    baseUrl: "https://2.development.byfreddy.io",
    headers: {"Content-Type": "application/json", "Accept": "application/json"},
    connectTimeout: 15000,
    receiveTimeout: 15000,
  );

  Dio dio = Dio(options);
  dio.interceptors.add(
    InterceptorsWrapper(
      onRequest: (Options options) async {
        dio.interceptors.requestLock.unlock();
        return options;
      },
    ),
  );

  return dio;
}
