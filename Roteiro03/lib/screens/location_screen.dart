import 'package:flutter/material.dart';
import 'dart:math';

class LocationScreen extends StatefulWidget {
  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  double _latitude = 0.0;
  double _longitude = 0.0;
  List<String> _history = [];

  void _simulateLocationUpdate() {
    setState(() {
      _latitude += Random().nextDouble() * 0.001 * (Random().nextBool() ? 1 : -1);
      _longitude += Random().nextDouble() * 0.001 * (Random().nextBool() ? 1 : -1);
      _history.add('Lat: ${_latitude.toStringAsFixed(6)}, Lon: ${_longitude.toStringAsFixed(6)}');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('GPS Simulado')),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: _history.length,
              itemBuilder: (context, index) {
                return ListTile(title: Text(_history[index]));
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: _simulateLocationUpdate,
              child: Text('Atualizar Localização'),
            ),
          ),
        ],
      ),
    );
  }
}
