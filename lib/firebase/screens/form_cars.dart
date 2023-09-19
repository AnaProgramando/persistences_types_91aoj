import 'package:flutter/material.dart';
import 'package:persistences_types/firebase/model/car.dart';

class CarFormWidget extends StatelessWidget {
  CarFormWidget({super.key});

  final _formKey = GlobalKey<FormState>();
  final _marcaController = TextEditingController();
  final _modeloController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    const title = Text("Novo Carro");
    return Scaffold(
        appBar: AppBar(title: title),
        body: Form(
            key: _formKey,
            child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      TextFormField(
                        decoration: const InputDecoration(
                            hintText: "Marca", labelText: "Marca"),
                        controller: _marcaController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Marca inválido";
                          }
                          return null;
                        },
                      ),
                      TextFormField(
                        decoration: const InputDecoration(
                            hintText: "Modelo", labelText: "Modelo"),
                        controller: _modeloController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Modelo inválido";
                          }
                          return null;
                        },
                      ),
                      Padding(
                          padding: const EdgeInsets.only(top: 8),
                          child: ElevatedButton(
                              child: const Text("Salvar"), onPressed: () {
                                if(_formKey.currentState != null 
                                  &&_formKey.currentState!.validate()){
                                    Car car = Car(_marcaController.text, _modeloController.text);
                                    Navigator.pop(context, car);
                                }
                              }))
                    ]))));
  }
}
