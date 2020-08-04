import 'dart:async';

import 'package:MobiTest/data/models/mobi_model.dart';
import 'package:MobiTest/domain/architecture/architecture.dart';
import 'package:MobiTest/domain/usecases/get_mobi_test_data_use_case.dart';
import 'package:get_it/get_it.dart';

class MobiTestPresenter extends MobiPresenter {
  GetMobiTestDataUseCase getMobiTestDataUseCase;

  // ignore: close_sinks
  final dataState = StreamController<MobiEntity>.broadcast();

  // ignore: close_sinks
  final busy = StreamController<bool>.broadcast();

  MobiTestPresenter(MobiPageState<MobiPresenter> mobiPageState)
      : super(mobiPageState);

  @override
  List<StreamController> get streamControllers => null;

  @override
  void onViewInit() {
    getMobiTestDataUseCase = GetIt.I.get<GetMobiTestDataUseCase>();
  }

  void getMobiTestData() async {
    busy.sink.add(true);
    try {
      MobiEntity data = await getMobiTestDataUseCase.execute();
      dataState.sink.add(MobiEntity(name: data.name, age: data.age));
    } catch (e) {
      print(e.toString());
    } finally {
      busy.sink.add(false);
    }
  }
}
