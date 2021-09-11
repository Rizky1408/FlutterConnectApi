import 'post_result_model.dart';
import 'package:flutter/material.dart';

void main(List<String> args) => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  PostApiResult postApiResult = null;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("api demo"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Text((postApiResult != null)
                  ? postApiResult.id +
                      " | " +
                      postApiResult.name +
                      " | " +
                      postApiResult.job +
                      " | " +
                      postApiResult.created
                  : "Tidak Ada Data"),
              // ignore: deprecated_member_use
              RaisedButton(
                onPressed: () {
                  PostApiResult.connectToApi("Rizky", "Apps Dev").then((value) {
                    postApiResult = value;
                    setState(() {});
                  });
                },
                child: Text("POST"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
