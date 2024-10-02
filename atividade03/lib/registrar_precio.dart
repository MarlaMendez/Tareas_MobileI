import 'package:flutter/material.dart';
import 'model/precio_combustible.dart';

class RegistrarPrecio extends StatelessWidget {
  final Function(PrecioCombustible) onCadastro;

  RegistrarPrecio({required this.onCadastro});

  final TextEditingController precioController = TextEditingController();
  final TextEditingController combustibleTipoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Registrar precio de combustible')),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextField(
              controller: precioController,
              decoration: InputDecoration(labelText: 'Precio por Litro'),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: combustibleTipoController,
              decoration: InputDecoration(labelText: 'Tipo de combustible'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                final double precio = double.tryParse(precioController.text) ?? 0;
                final String combustibleTipo = combustibleTipoController.text;
                if (precio > 0 && combustibleTipo.isNotEmpty) {
                  onCadastro(PrecioCombustible(precio: precio, combustibleTipo: combustibleTipo, fecha: DateTime.now()));
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
