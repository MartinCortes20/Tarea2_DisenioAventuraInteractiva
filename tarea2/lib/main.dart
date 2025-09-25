import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'screens/world_map_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  // Configurar la barra de estado
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
    ),
  );
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
        useMaterial3: true,
      ),
      home: const WorldMapScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
