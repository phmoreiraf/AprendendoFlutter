import 'package:flutter/material.dart';

import '../services/location_service.dart';

class LocationScreen extends StatelessWidget {
  final LocationService _locationService = LocationService();

  Future<void> _getLocation(BuildContext context) async {
    try {
      await _locationService.requestLocationPermission();
      final position = await _locationService.getCurrentLocation();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Localização: ${position.latitude}, ${position.longitude}')),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Erro: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Localização')),
      body: Center(
        child: ElevatedButton(
          onPressed: () => _getLocation(context),
          child: Text('Obter Localização'),
        ),
      ),
    );
  }
}
