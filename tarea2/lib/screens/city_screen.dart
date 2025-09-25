import 'package:flutter/material.dart';
import '../widgets/title_widget.dart';
import '../widgets/interest_point_widget.dart';
import '../constants/app_colors.dart';
import '../models/place_info.dart';

class CityScreen extends StatelessWidget {
  const CityScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Lista de puntos de interés de CDMX
    final List<PlaceInfo> cdmxPlaces = [
      PlaceInfo(
        icon: Icons.account_balance,
        title: 'Zócalo',
        description: 'Plaza principal e histórica\nCorazón de la ciudad',
        color: AppColors.interestOrange,
      ),
      PlaceInfo(
        icon: Icons.park,
        title: 'Chapultepec',
        description: 'Uno de los parques urbanos\nmás grandes del mundo',
        color: AppColors.interestGreen,
      ),
      PlaceInfo(
        icon: Icons.article,
        title: 'Datos CDMX',
        description:
            '9 millones de habitantes\n1,485 km² de superficie\n16 alcaldías\nPatrimonio de la Humanidad',
        color: AppColors.interestBlue,
      ),
      PlaceInfo(
        icon: Icons.restaurant,
        title: 'Gastronomía',
        description:
            'Tacos, quesadillas, tamales\nCocina patrimonio inmaterial',
        color: AppColors.interestRed,
      ),
    ];

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              AppColors.cdmxGradientStart,
              AppColors.cdmxGradientMiddle,
              AppColors.cdmxGradientEnd,
            ],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              _buildBackButton(context),
              const TitleWidget(
                title: '🏙️ CIUDAD DE MÉXICO',
                subtitle: 'Capital de México',
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      children: [
                        // Generar puntos de interés dinámicamente
                        ...cdmxPlaces.map((place) => Padding(
                              padding: const EdgeInsets.only(bottom: 20),
                              child: InterestPointWidget(
                                icon: place.icon,
                                title: place.title,
                                description: place.description,
                                color: place.color,
                              ),
                            )),
                        const SizedBox(height: 10),
                        
                        // Botón para volver al inicio
                        _buildHomeButton(context),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBackButton(BuildContext context) {
    return Row(
      children: [
        IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white, size: 30),
          onPressed: () => Navigator.pop(context),
        ),
      ],
    );
  }

  Widget _buildHomeButton(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: () {
        Navigator.popUntil(context, (route) => route.isFirst);
      },
      icon: const Icon(Icons.home),
      label: const Text('Volver al Mapa Mundial'),
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        padding: const EdgeInsets.symmetric(
          horizontal: 30,
          vertical: 15,
        ),
        textStyle: const TextStyle(fontSize: 16),
      ),
    );
  }
}