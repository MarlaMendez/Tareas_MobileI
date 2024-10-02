import 'package:flutter/material.dart';
import 'model/auto.dart';
import 'model/destino.dart';
import 'model/precio_combustible.dart';

class CalcularViaje extends StatefulWidget {
  final List<Auto> autos;
  final List<Destino> destinos;
  final List<PrecioCombustible> preciosCombustible;

  CalcularViaje({
    required this.autos,
    required this.destinos,
    required this.preciosCombustible,
  });

  @override
  _CalcularViajeState createState() => _CalcularViajeState();
}

class _CalcularViajeState extends State<CalcularViaje> {
  Auto? autoSelecionado;
  Destino? destinoSelecionado;
  PrecioCombustible? precioCombustibleSelecionado;
  double? custoViaje;

  void calcularCostoViaje() {
    if (autoSelecionado != null &&
        destinoSelecionado != null &&
        precioCombustibleSelecionado != null) {
      double litrosNecesarios =
          destinoSelecionado!.kmDist / autoSelecionado!.kmlitro;
      double custoTotal =
          litrosNecesarios * precioCombustibleSelecionado!.precio;

      setState(() {
        custoViaje = custoTotal;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculo del Viaje'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            DropdownButton<Auto>(
              hint: Text('Seleccione un auto'),
              value: autoSelecionado,
              onChanged: (Auto? nuevoAuto) {
                setState(() {
                  autoSelecionado = nuevoAuto;
                });
              },
              items: widget.autos.map((Auto auto) {
                return DropdownMenuItem<Auto>(
                  value: auto,
                  child: Text(auto.nome),
                );
              }).toList(),
            ),
            SizedBox(height: 20),
            DropdownButton<Destino>(
              hint: Text('Selecione un Destino'),
              value: destinoSelecionado,
              onChanged: (Destino? nuevoDestino) {
                setState(() {
                  destinoSelecionado = nuevoDestino;
                });
              },
              items: widget.destinos.map((Destino destino) {
                return DropdownMenuItem<Destino>(
                  value: destino,
                  child: Text(destino.id),
                );
              }).toList(),
            ),
            SizedBox(height: 20),
            DropdownButton<PrecioCombustible>(
              hint: Text('Selecione el precio para el combustible'),
              value: precioCombustibleSelecionado,
              onChanged: (PrecioCombustible? nuevoPrecio) {
                setState(() {
                  precioCombustibleSelecionado = nuevoPrecio;
                });
              },
              items: widget.preciosCombustible.map((PrecioCombustible precio) {
                return DropdownMenuItem<PrecioCombustible>(
                  value: precio,
                  child: Text(
                      '${precio.combustibleTipo} - R\$ ${precio.precio.toStringAsFixed(2)}'),
                );
              }).toList(),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: calcularCostoViaje,
              child: Text('Calcular el costo del Viaje'),
            ),
            SizedBox(height: 20),
            if (custoViaje != null)
              Text(
                'Estimativa del costo: R\$ ${custoViaje!.toStringAsFixed(2)}',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
          ],
        ),
      ),
    );
  }
}
