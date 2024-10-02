import 'package:flutter/material.dart';
import 'model/auto.dart';

class RegistrarAuto extends StatelessWidget {
  final Function(Auto) onCadastro;

  RegistrarAuto({required this.onCadastro});

  final TextEditingController nomeController = TextEditingController();
  final TextEditingController kmlitroController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Registrar Auto')),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextField(
              controller: nomeController,
              decoration: InputDecoration(labelText: 'Nombre del Auto'),
            ),
            TextField(
              controller: kmlitroController,
              decoration: InputDecoration(labelText: 'Km por litro'),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                final String nome = nomeController.text;
                final double kmlitro = double.tryParse(kmlitroController.text) ?? 0;
                if (nome.isNotEmpty && kmlitro > 0) {
                  onCadastro(Auto(nome: nome, kmlitro: kmlitro));
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
