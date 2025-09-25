import 'package:flutter/material.dart';
import 'screens/world_map_screen.dart';

void main() {
  runApp(const GeographicAdventureApp());
}

class GeographicAdventureApp extends StatelessWidget {
  const GeographicAdventureApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aventura Geográfica',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Roboto',
      ),
      home: const WorldMapScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}