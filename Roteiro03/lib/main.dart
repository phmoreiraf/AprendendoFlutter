import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'screens/location_screen.dart';
import 'screens/camera_screen.dart';
import 'screens/favorites_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      initialRoute: '/',
      routes: {
        '/': (context) => HomeScreen(),
        '/location': (context) => LocationScreen(),
        '/camera': (context) => CameraScreen(),
        '/favorites': (context) => FavoritesScreen(),
      },
    );
  }
}
