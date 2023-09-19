import 'package:flutter/material.dart';
import 'package:persistences_types/commons/list_item.dart';
import 'package:persistences_types/firebase/model/car.dart';

class ListCarsItemWidget extends StatelessWidget {
  const ListCarsItemWidget(
      {super.key,
      required this.leading,
      required this.marca,
      required this.modelo,
      required this.onLongPress});

  final String leading;
  final String marca;
  final String modelo;
  final void Function() onLongPress;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Card(
          child: ListTile(
            leading: Text(leading),
            title: Text(marca),
            subtitle: Text(modelo),
            onLongPress: onLongPress,
          ),
        ),
      body: buildList(context),  
    );
  }

  Widget buildList(BuildContext context){
    return StreamBuilder<QueryDocumentSnapshot>(
      stream: FirebaseFirestore.instance.collection("cars").snapshots(),
      builder: (context, snapshot){
        if(!snapshot.data == null){
          return Container(child: const Text("Nenhumn carro encontrao!"));
        }else{
          return buildListView(context, snapshot.data!.docs);
        }
      }
    )
  }
  
  Widget buildListView(BuildContext context, List<QueryDocumentSnapshot> snapshots){
    return ListView(
      padding: EdgeInsets.only(top: 30),
      children: snapshots.map((data) => _buildItem(context, data)).toList(),
    );
  }

  Widget _buildItem(BuildContext context, QueryDocumentSnapshot data) {
  Car c = Car.fromSnapshot(data);
  return Padding(
    padding: const EdgeInsets.all(12),
    child: ListItemWidget(leading: "", title: c.marca, subtitle: c.modelo,onLongPress: (){

    }));
  }
}