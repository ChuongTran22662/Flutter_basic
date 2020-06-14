import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

//Mỗi Statefuk widget được tạo thành từ 2 class sau :
//- Một public class kế thừa tiwf StatefulWidget
//-Một private class để vẽ giao diện (qua hàm build)
class MyApp extends StatefulWidget {
  String name;
  int age;

  MyApp({this.name, this.age});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
//  String name;
//  int age;
//
//  MyApp({this.name, this.age});
//
//  @override
//  Widget build(BuildContext context) {
//    return MaterialApp(
//      title: 'This is my first app',
//      home: Scaffold(
//          body: Center(
//              child: Text(
//                'name : ${this.name}, age : ${this.age}',
//                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
//                textDirection: TextDirection.ltr,
//              ))),
//    );
//  }
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
  String _email = '';
  final emailEditingController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    print('Run initState');
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    WidgetsBinding.instance.addObserver(this);
    print('Run dispose');
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    // TODO: implement didChangeAppLifecycleState
    super.didChangeAppLifecycleState(state);
    if (state == AppLifecycleState.paused) {
      print('App is in Background mode');
    } else if (state == AppLifecycleState.resumed) {
      print('App is in Foreground mode');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'This ia a StatefulWidget',
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: TextField(
                  controller: emailEditingController,
                  onChanged: (text) {
                    this.setState(() {
                      _email = text;
                    });
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius:
                            const BorderRadius.all(const Radius.circular(15))),
                    labelText: 'Enter your email',
                  ),
                ),
              ),
              Text(
                'Result',
                style: TextStyle(fontSize: 30, color: Colors.blue),
              ),
              Text(
                _email,
                style: TextStyle(fontSize: 30, color: Colors.green),
              )
            ],
          ),
        ),
      ),
    );
  }
}
