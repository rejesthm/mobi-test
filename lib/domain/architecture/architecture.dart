import 'dart:async';

import 'package:flutter/cupertino.dart';

abstract class MobiPage extends StatefulWidget {
  MobiPage({Key key}) : super(key: key);

  @override
  MobiPageState createState();
}

abstract class MobiPageState<P extends MobiPresenter> extends State<MobiPage> {
  P presenter;

  P createPresenter();

  @override
  void initState() {
    presenter = createPresenter();
    super.initState();
    presenter.onViewInit();
  }

  @override
  void dispose() {
    presenter.dispose();
    super.dispose();
  }
}

abstract class MobiPresenter {
  MobiPageState mobiPageState;

  BuildContext get context => mobiPageState.context;

  MobiPresenter(this.mobiPageState);

  List<StreamController> get streamControllers;

  void onViewInit();

  void dispose() {
    streamControllers?.map((disposable) {
      disposable.close();
    });
  }

  void notify() {
    mobiPageState.presenter = this;
  }
}

abstract class MobiUseCase {}

abstract class MobiModel {}

abstract class MobiMapper<T extends MobiModel> {
  Map<String, dynamic> toMap(T object);

  T fromMap(Map<String, dynamic> map);

  List<T> fromListMap(List<dynamic> listMap) {
    List<T> list = [];
    listMap.forEach(
      (object) {
        list.add(
          fromMap(object),
        );
      },
    );
    return list;
  }
}
