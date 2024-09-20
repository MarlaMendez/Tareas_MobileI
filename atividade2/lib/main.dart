import 'package:flutter/material.dart';
import 'package:atividade2/model/pessoa.dart';
import 'package:atividade2/info.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "App para inscrição de Pessoas",
      home: Tela1(),
    );
  }
}

class Tela1 extends StatefulWidget {
  const Tela1({super.key});

  @override
  State<Tela1> createState() => _Tela1State();
}

class _Tela1State extends State<Tela1> {
  List<Pessoa> lista = [];

  void removerItem(int index) {
    setState(() {
      lista.removeAt(index);
    });
  }

  //metodo que hice para abrir el modal
  void abrirFormulario() {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Formulario(
          onCadastro: (Pessoa novaPessoa) {
            setState(() {
              lista.add(novaPessoa);
            });
            Navigator.pop(context);
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("App para inscrição de Pessoas"),
        backgroundColor: const Color.fromRGBO(194, 0, 212, 1),
      ),
      body: ListView.builder(
        itemCount: lista.length,
        itemBuilder: (context, index) {
          return Info(
            nome: lista[index].nome,
            sobrenome: lista[index].sobrenome,
            onRemove: () => removerItem(index),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: abrirFormulario,
        child: Icon(Icons.add),
        backgroundColor: const Color.fromRGBO(194, 0, 212, 1),
      ),
    );
  }
}

class Formulario extends StatelessWidget {
  final Function(Pessoa) onCadastro;

  Formulario({required this.onCadastro});

  final TextEditingController nomeController = TextEditingController();
  final TextEditingController sobrenomeController = TextEditingController();
  final TextEditingController idadeController = TextEditingController();
  final TextEditingController cpfController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: nomeController,
            decoration: InputDecoration(labelText: 'Nome'),
          ),
          TextField(
            controller: sobrenomeController,
            decoration: InputDecoration(labelText: 'Sobrenome'),
          ),
          TextField(
            controller: idadeController,
            decoration: InputDecoration(labelText: 'Idade'),
            keyboardType: TextInputType.number,
          ),
          TextField(
            controller: cpfController,
            decoration: InputDecoration(labelText: 'CPF'),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              final String nome = nomeController.text;
              final String sobrenome = sobrenomeController.text;
              final int idade = int.tryParse(idadeController.text) ?? -1;
              final String cpf = cpfController.text;

              if (nome.isNotEmpty && sobrenome.isNotEmpty && idade > 0) {
                onCadastro(Pessoa(
                  nome: nome,
                  sobrenome: sobrenome,
                  idade: idade,
                  cpf: cpf,
                ));
              }
            },
            child: Text('Cadastrar'),
          ),
        ],
      ),
    );
  }
}
