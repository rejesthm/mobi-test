import 'package:MobiTest/data/models/mobi_model.dart';
import 'package:MobiTest/domain/architecture/architecture.dart';
import 'package:MobiTest/mobi/mobi_presenter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Mobi extends MobiPage {
  @override
  _MobiPageState createState() => _MobiPageState();
}

class _MobiPageState extends MobiPageState<MobiTestPresenter> {
  @override
  MobiTestPresenter createPresenter() {
    return MobiTestPresenter(this);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Mobi Test"),
          elevation: 0.0,
          actions: <Widget>[
            Center(
              child: InkWell(
                onTap: () {
                  presenter.getMobiTestData();
                },
                child: Container(
                  padding: EdgeInsets.only(right: 20.0),
                  child: StreamBuilder<bool>(
                      stream: presenter.busy.stream,
                      initialData: false,
                      builder: (context, snapshot) {
                        if (snapshot.data) {
                          return Container(
                              width: 20.0,
                              height: 20.0,
                              child: CupertinoActivityIndicator());
                        }
                        return Text("Show data");
                      }),
                ),
              ),
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.symmetric(vertical: 10.0),
            child: StreamBuilder<MobiEntity>(
                stream: presenter.dataState.stream,
                initialData: MobiEntity(name: "", age: ""),
                builder: (context, snapshot) {
                  return Container(
                    padding:
                        EdgeInsets.symmetric(vertical: 20.0, horizontal: 15.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          snapshot.data.name ?? "",
                          style: TextStyle(fontSize: 18),
                        ),
                        Text(
                          snapshot.data.age ?? "",
                          style: TextStyle(fontSize: 18, color: Colors.black54),
                        ),
                      ],
                    ),
                  );
                }),
          ),
        ),
      ),
    );
  }
}
