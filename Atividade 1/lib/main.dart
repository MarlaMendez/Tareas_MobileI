import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Atividade 1',
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Atividade 1"),
          backgroundColor: const Color.fromARGB(255, 194, 91, 125),
        ),
        body:  Column(
          children: [
            const Center(
              child: CircleAvatar(
                radius: 80.0,
                backgroundImage: NetworkImage(
                    "https://paradepets.com/.image/ar_1:1%2Cc_fill%2Ccs_srgb%2Cfl_progressive%2Cq_auto:good%2Cw_1200/MTkxMzY1Nzg5MjI1NTI2ODE3/small-cat-breeds-1-jpg.jpg"),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(18.0),
              child: TextField(
                decoration: InputDecoration(
                  labelText: "Usuario",
                  border: OutlineInputBorder(),
                ),
              ),
            ),
           const Padding(
              padding: EdgeInsets.all(18.0),
              child: TextField(
                decoration: InputDecoration(
                  labelText: "Senha",
                  border: OutlineInputBorder(),
                ),
              ),
            ),
           const SizedBox(height: 18.0),
            ElevatedButton(
              onPressed: () {},
              child: const Text("Login"),
            )
          ],
        ),
      ),
    );
  }
}
