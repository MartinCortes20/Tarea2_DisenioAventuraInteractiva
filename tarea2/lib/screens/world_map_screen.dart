import 'package:flutter/material.dart';
import '../widgets/title_widget.dart';
import '../widgets/interest_point_widget.dart';
import '../widgets/navigation_button.dart';
import '../constants/app_colors.dart';
import 'continent_screen.dart';

class WorldMapScreen extends StatelessWidget {
  const WorldMapScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              AppColors.worldGradientStart,
              AppColors.worldGradientMiddle,
              AppColors.worldGradientEnd,
            ],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              const SizedBox(height: 20),
              const TitleWidget(
                title: '🌍 MAPA MUNDIAL',
                subtitle: 'Selecciona un continente para explorar',
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
                          icon: Icons.public,
                          title: 'Planeta Tierra',
                          description:
                              '🌊 510.1 millones km² de superficie\n👥 7.9 mil millones de habitantes\n🌡️ Temperatura promedio: 15°C',
                          color: AppColors.interestCyan,
                        ),
                        const SizedBox(height: 50),
                        
                        // Decoración adicional
                        _buildDecorativeInfo(),
                        const SizedBox(height: 50),
                        
                        Hero(
                          tag: 'america',
                          child: NavigationButton(
                            text: 'AMÉRICA',
                            icon: Icons.explore,
                            color: const Color(0xFF059669),
                            onTap: () => _navigateToContinent(context),
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

  Widget _buildDecorativeInfo() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildStatCard('7', 'Continentes', Icons.language),
          _buildStatCard('195', 'Países', Icons.flag),
          _buildStatCard('5', 'Océanos', Icons.water),
        ],
      ),
    );
  }

  Widget _buildStatCard(String number, String label, IconData icon) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.15),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.white.withOpacity(0.3)),
      ),
      child: Column(
        children: [
          Icon(icon, color: Colors.white, size: 28),
          const SizedBox(height: 8),
          Text(
            number,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            label,
            style: TextStyle(
              color: Colors.white.withOpacity(0.8),
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }

  void _navigateToContinent(BuildContext context) {
    Navigator.push(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) =>
            const ContinentScreen(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          const begin = 0.5;
          const end = 1.0;
          const curve = Curves.easeInOut;
          var tween = Tween(begin: begin, end: end).chain(
            CurveTween(curve: curve),
          );
          return ScaleTransition(
            scale: animation.drive(tween),
            child: child,
          );
        },
        transitionDuration: const Duration(milliseconds: 800),
      ),
    );
  }
}