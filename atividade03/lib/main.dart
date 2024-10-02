import 'package:flutter/material.dart';
import 'model/auto.dart';
import 'model/destino.dart';
import 'model/precio_combustible.dart';
import 'registrar_auto.dart';
import 'registrar_destino.dart';
import 'registrar_precio.dart';
import 'calcular_viaje.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TelaPrincipal(),
    );
  }
}

class TelaPrincipal extends StatefulWidget {
  @override
  _TelaPrincipalState createState() => _TelaPrincipalState();
}

class _TelaPrincipalState extends State<TelaPrincipal> {
  List<Auto> autos = [];
  List<Destino> destinos = [];
  List<PrecioCombustible> preciosCombustible = [];

  void adicionarAuto(Auto auto) {
    setState(() {
      autos.add(auto);
    });
  }

  void adicionarDestino(Destino destino) {
    setState(() {
      destinos.add(destino);
    });
  }

  void adicionarPrecioCombustible(PrecioCombustible precio) {
    setState(() {
      preciosCombustible.add(precio);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Aplicacion para calculo de viaje'),
        backgroundColor: const Color.fromARGB(255, 238, 6, 199),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment:
                MainAxisAlignment.center, // Centrar verticalmente
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          RegistrarAuto(onCadastro: adicionarAuto),
                    ),
                  );
                },
                child: Text('Registrar Auto'),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          RegistrarDestino(onCadastro: adicionarDestino),
                    ),
                  );
                },
                child: Text('Registrar Destino'),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => RegistrarPrecio(
                          onCadastro: adicionarPrecioCombustible),
                    ),
                  );
                },
                child: Text('Registrar precio de Combustible'),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CalcularViaje(
                        autos: autos,
                        destinos: destinos,
                        preciosCombustible: preciosCombustible,
                      ),
                    ),
                  );
                },
                child: Text('Calcular costo del viaje'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
