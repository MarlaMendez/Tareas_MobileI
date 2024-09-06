import 'package:flutter/material.dart';

class App1 extends StatelessWidget {
  final String username;

  const App1({super.key, required this.username});

  @override
  Widget build(BuildContext context) {
    var username;
    return Scaffold(
      appBar: AppBar(
        title: const Text('App1'),
      ),
      body: Center(
        child: Text(
          "Bem vindo(a), $username!",
          style: const TextStyle(fontSize: 40.0),
        ),
      ),
    );
  }
}
