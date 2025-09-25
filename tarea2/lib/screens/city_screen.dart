import 'package:flutter/material.dart';
import '../widgets/title_widget.dart';
import '../widgets/interest_point_widget.dart';
import '../constants/app_colors.dart';
import '../models/place_info.dart';

class CityScreen extends StatelessWidget {
  const CityScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<PlaceInfo> cdmxPlaces = [
      PlaceInfo(
        icon: Icons.account_balance,
        title: 'Zócalo',
        description:
            '🏛️ Plaza principal e histórica\n❤️ Corazón de la ciudad\n📍 Centro Histórico\n🎭 Eventos culturales',
        color: AppColors.interestOrange,
      ),
      PlaceInfo(
        icon: Icons.park,
        title: 'Bosque de Chapultepec',
        description:
            '🌳 686 hectáreas de naturaleza\n🏰 Castillo histórico\n🦁 Zoológico\n🎨 Museos de clase mundial',
        color: AppColors.interestGreen,
      ),
      PlaceInfo(
        icon: Icons.article,
        title: 'Datos CDMX',
        description:
            '👥 9 millones de habitantes\n🗺️ 1,485 km² de superficie\n🏛️ 16 alcaldías\n🌍 Patrimonio de la Humanidad UNESCO',
        color: AppColors.interestBlue,
      ),
      PlaceInfo(
        icon: Icons.restaurant,
        title: 'Gastronomía',
        description:
            '🌮 Tacos al pastor\n🫔 Quesadillas y tamales\n🍫 Chocolate tradicional\n🎖️ Patrimonio Inmaterial UNESCO',
        color: AppColors.interestRed,
      ),
      PlaceInfo(
        icon: Icons.directions_subway,
        title: 'Transporte',
        description:
            '🚇 12 líneas de Metro\n🚌 Red de Metrobús\n🚴 Ecobici (bicicletas públicas)\n✈️ AICM: Aeropuerto Internacional',
        color: AppColors.interestPink,
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
              Padding(
                padding: const EdgeInsets.only(left: 8, top: 8),
                child: Row(
                  children: [
                    IconButton(
                      icon: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                          size: 24,
                        ),
                      ),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ],
                ),
              ),
              const TitleWidget(
                title: '🏙️ CIUDAD DE MÉXICO',
                subtitle: 'Capital de México - Una de las ciudades más grandes del mundo',
              ),
              Expanded(
                child: ListView(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  children: [
                    ...cdmxPlaces.map((place) => Padding(
                          padding: const EdgeInsets.only(bottom: 20),
                          child: InterestPointWidget(
                            icon: place.icon,
                            title: place.title,
                            description: place.description,
                            color: place.color,
                          ),
                        )),
                    const SizedBox(height: 20),
                    
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: ElevatedButton.icon(
                        onPressed: () {
                          Navigator.popUntil(context, (route) => route.isFirst);
                        },
                        icon: const Icon(Icons.home, size: 24),
                        label: const Text(
                          'Volver al Mapa Mundial',
                          style: TextStyle(fontSize: 18),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          foregroundColor: const Color(0xFF1F2937),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 32,
                            vertical: 18,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          elevation: 8,
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}