import 'package:flutter/cupertino.dart';

class Car {
  String name;
  int yearOfProduction;

  //contructor
  //c1 :
//  Car(String name ,int yearOfProduction){
//    this.name = name;
//    this.yearOfProduction = yearOfProduction;
//  }

  //c2 :
  //Car(this.name, this.yearOfProduction);

  Car({@required this.name, @required this.yearOfProduction = 2020});

  @override
  String toString() {
    // TODO: implement toString
    return '${this.name} - ${this.yearOfProduction}';
  }

  void doSomeThing() {
    print("I am do something");
    this.handelEvent();
  }

  void sayHello({String personName}) {
    print('Hello :' + personName);
  }

  Function handelEvent;
}
