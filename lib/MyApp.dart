import 'dart:ffi';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
  final _contentController = TextEditingController();
  final _amountController = TextEditingController();

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  String _content;
  double _amount;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    super.dispose();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'This ia a StatefulWidget',
      home: Scaffold(
        key: _scaffoldKey,
        body: SafeArea(
          minimum: const EdgeInsets.only(left: 20, right: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextField(
                decoration: InputDecoration(labelText: 'Content'),
                controller: _contentController,
                onChanged: (text) {
                  setState(() {
                    _content = text;
                  });
                },
              ),
              TextField(
                decoration: InputDecoration(labelText: 'Amount(money)'),
                controller: _amountController,
                onChanged: (text) {
                  setState(() {
                    _amount = double.tryParse(text) ?? 0;
                  });
                },
              ),
              FlatButton(
                child: Text('Insert Transaction'),
                color: Colors.pinkAccent,
                textColor: Colors.white,
                onPressed: () {
                  print(
                      'Content : ${this._content} , amount : ${this._amount}');
                  _scaffoldKey.currentState.showSnackBar(SnackBar(
                    content: Text(
                        'Content : ${this._content} , amount : ${this._amount}'),
                    duration: Duration(seconds: 3),
                  ));
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
