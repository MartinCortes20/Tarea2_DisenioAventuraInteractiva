import 'package:flutter/material.dart';
import '../widgets/title_widget.dart';
import '../widgets/interest_point_widget.dart';
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
              const TitleWidget(
                title: '🌍 MAPA MUNDIAL',
                subtitle: 'Selecciona un continente para explorar',
              ),
              Expanded(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Punto de interés del Mundo
                      const InterestPointWidget(
                        icon: Icons.public,
                        title: 'Planeta Tierra',
                        description:
                            '510.1 millones km² de superficie\n7.9 mil millones de habitantes',
                        color: AppColors.interestGreen,
                      ),
                      const SizedBox(height: 40),
                      
                      // Botón animado para navegar a América
                      _buildAmericaButton(context),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAmericaButton(BuildContext context) {
    return Hero(
      tag: 'america',
      child: GestureDetector(
        onTap: () => _navigateToContinent(context),
        child: Container(
          width: 200,
          height: 200,
          decoration: BoxDecoration(
            color: Colors.green.shade700,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: Colors.green.withOpacity(0.5),
                blurRadius: 30,
                spreadRadius: 5,
              ),
            ],
          ),
          child: const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.location_on, size: 60, color: Colors.white),
              SizedBox(height: 10),
              Text(
                'AMÉRICA',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
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