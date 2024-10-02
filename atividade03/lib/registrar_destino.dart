import 'package:flutter/material.dart';
import 'model/destino.dart';

class RegistrarDestino extends StatelessWidget {
  final Function(Destino) onCadastro;

  RegistrarDestino({required this.onCadastro});

  final TextEditingController idController = TextEditingController();
  final TextEditingController kmDistController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Registrar Destino')),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextField(
              controller: idController,
              decoration: InputDecoration(labelText: 'Id'),
            ),
            TextField(
              controller: kmDistController,
              decoration: InputDecoration(labelText: 'Distancia en KM'),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                final String id = idController.text;
                final double kmDist = double.tryParse(kmDistController.text) ?? 0;
                if (id.isNotEmpty && kmDist > 0) {
                  onCadastro(Destino(id: id, kmDist: kmDist));
                  Navigator.pop(context);
                }
              },
              child: Text('Registrar'),
            ),
          ],
        ),
      ),
    );
  }
}
