import 'package:flutter/material.dart';
import '../services/location_service.dart';
import '../utils/logger.dart';

class LocationScreen extends StatelessWidget {
  final LocationService _locationService = LocationService();

  Future<void> _getLocation(BuildContext context) async {
    try {
      await _locationService.requestLocationPermission();
      final position = await _locationService.getCurrentLocation();
      logError(context, 'Latitude: ${position.latitude}, Longitude: ${position.longitude}');
    } catch (e) {
      logError(context, e.toString());
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
