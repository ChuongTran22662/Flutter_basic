import 'package:flutter/material.dart';
import 'caculation.dart';
import 'car.dart';

void main() {
  //stringNumbers.forEach((element) {
  //  print(element);
  //});

//  var myCar = Car(name: 'Mercedes xxx', yearOfProduction: 2020);
//
//  myCar.handelEvent= () {
//    print("Handel in main");
//  };
//
//  myCar.doSomeThing();
//
//  myCar.sayHello(personName: 'Chuong');

  List<Car> cars = <Car>[];

  cars.add(Car(name: 'aa', yearOfProduction: 2016));
  cars.add(Car(name: 'bb', yearOfProduction: 2017));

  cars.sort((car1,car2)=> -car1.yearOfProduction + car2.yearOfProduction);

  var filterCars = cars.where((element) => element.yearOfProduction == 2016).toList();

  filterCars.forEach((element) {
    print(element);
  });

  var personA = new Map();
  personA['name'] = 'Chuong';
  personA['age'] = '22';

  print(personA);

  runApp(Center(
      child: Text(
    cars.toString(),
    style: TextStyle(fontSize: 30),
    textDirection: TextDirection.ltr,
  )));
}
