import 'package:flutter/material.dart';
import 'package:flutter_application_1/App1.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _obscureText = true;

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

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
        body: Column(
          children: [
            const Center(
              child: CircleAvatar(
                radius: 80.0,
                backgroundImage: NetworkImage(
                    "https://paradepets.com/.image/ar_1:1%2Cc_fill%2Ccs_srgb%2Cfl_progressive%2Cq_auto:good%2Cw_1200/MTkxMzY1Nzg5MjI1NTI2ODE3/small-cat-breeds-1-jpg.jpg"),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: TextField(
                controller: _usernameController,
                decoration: const InputDecoration(
                  labelText: "Usuario",
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: TextField(
                controller: _passwordController,
                obscureText: _obscureText,
                decoration: InputDecoration(
                  labelText: "Senha",
                  suffixIcon: IconButton(
                    icon: Icon(
                      _obscureText ? Icons.visibility_off : Icons.visibility,
                    ),
                    onPressed: () {
                      setState(() {
                        _obscureText = !_obscureText;
                      });
                    },
                  ),
                  border: const OutlineInputBorder(),
                ),
              ),
            ),
            const SizedBox(height: 18.0),
            ElevatedButton(
              onPressed: () {
                if (_usernameController.text.isNotEmpty &&
                    _passwordController.text.isNotEmpty) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => App1(
                        username: _usernameController.text,
                      ),
                    ),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Porfavor completar todos los campos!"),
                      backgroundColor: Colors.pink,
                    ),
                  );
                }
              },
              child: const Text("Login"),
            ),
          ],
        ),
      ),
    );
  }
}
