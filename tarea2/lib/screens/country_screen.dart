import 'package:flutter/material.dart';
import '../widgets/title_widget.dart';
import '../widgets/interest_point_widget.dart';
import '../widgets/navigation_button.dart';
import '../constants/app_colors.dart';
import 'city_screen.dart';

class CountryScreen extends StatelessWidget {
  const CountryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [
              AppColors.mexicoGreen,
              AppColors.mexicoWhite,
              AppColors.mexicoRed,
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
                          color: Colors.black.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Icon(
                          Icons.arrow_back,
                          color: Colors.black87,
                          size: 24,
                        ),
                      ),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ],
                ),
              ),
              const TitleWidget(
                title: '🇲🇽 REPÚBLICA MEXICANA',
                subtitle: 'País de rica historia y cultura',
              ),
              Expanded(
                child: Center(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(height: 20),
                        const InterestPointWidget(
                          icon: Icons.museum,
                          title: 'República Mexicana',
                          description:
                              '👥 128 millones de habitantes\n🗺️ 1.96 millones km²\n🏛️ 32 estados\n🎨 Rico patrimonio cultural UNESCO',
                          color: AppColors.interestPurple,
                        ),
                        const SizedBox(height: 30),
                        const InterestPointWidget(
                          icon: Icons.celebration,
                          title: 'Cultura y Tradiciones',
                          description:
                              '🎭 Día de Muertos\n🌮 Gastronomía Patrimonio Inmaterial\n🎵 Mariachi\n🏛️ Pirámides prehispánicas',
                          color: AppColors.interestOrange,
                        ),
                        const SizedBox(height: 50),
                        
                        Hero(
                          tag: 'cdmx',
                          child: NavigationButton(
                            text: 'CDMX',
                            icon: Icons.location_city,
                            color: const Color(0xFF8B5CF6),
                            onTap: () => _navigateToCity(context),
                          ),
                        ),
                        const SizedBox(height: 20),
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

  void _navigateToCity(BuildContext context) {
    Navigator.push(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) =>
            const CityScreen(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return FadeTransition(
            opacity: animation,
            child: ScaleTransition(
              scale: Tween<double>(begin: 0.8, end: 1.0).animate(
                CurvedAnimation(
                  parent: animation,
                  curve: Curves.easeOutBack,
                ),
              ),
              child: child,
            ),
          );
        },
        transitionDuration: const Duration(milliseconds: 900),
      ),
    );
  }
}