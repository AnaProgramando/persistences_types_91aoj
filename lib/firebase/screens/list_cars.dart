import 'package:flutter/material.dart';
import 'package:persistences_types/commons/constants.dart';
import 'package:persistences_types/commons/list_cars.dart';
import 'package:persistences_types/commons/list_item.dart';
import 'package:persistences_types/firebase/model/car.dart';
import 'package:persistences_types/firebase/screens/form_cars.dart';
import 'package:persistences_types/floor/daos/book_dao.dart';
import 'package:persistences_types/floor/database/appDatabase.dart';
import 'package:persistences_types/floor/models/book.dart';
import 'package:persistences_types/floor/screens/form_book.dart';

class LisCarsWidget extends StatefulWidget {
  const LisCarsWidget({super.key});

  @override
  State<LisCarsWidget> createState() => _LisCarsWidgetState();
}

class _LisCarsWidgetState extends State<LisCarsWidget> {
  List<Book> books = [];
  BookDAO? dao;

  @override
  void initState(){
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    const title = Text("Carros");
    final addRoute = CarFormWidget(); 

    List<Car> cars = [];

    return Scaffold(
      appBar: AppBar(
          title: title,
          actions: [IconButton(icon: addIcon, onPressed: () {
            Navigator.push(context, 
            MaterialPageRoute(builder: (context) => addRoute)).then((cars) => null);
          })]),
      body: ListView.separated(
          itemBuilder: (context, index) {
            final item = cars[index];
            return ListCarsItemWidget(marca: item.marca, leading: "1", modelo: item.modelo, onLongPress: _onDeleteBook);
          },
          separatorBuilder: (context, index) => Container(),
          itemCount: cars.length),
    );
  }

  _onDeleteBook(){

  }
}
