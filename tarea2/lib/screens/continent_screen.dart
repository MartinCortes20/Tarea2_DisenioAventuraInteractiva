import 'package:flutter/material.dart';
import '../widgets/title_widget.dart';
import '../widgets/interest_point_widget.dart';
import '../constants/app_colors.dart';
import 'country_screen.dart';

class ContinentScreen extends StatelessWidget {
  const ContinentScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              AppColors.americaGradientStart,
              AppColors.americaGradientMiddle,
              AppColors.americaGradientEnd,
            ],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              _buildBackButton(context),
              const TitleWidget(
                title: '🌎 CONTINENTE AMERICANO',
                subtitle: 'Explora los países de América',
              ),
              Expanded(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Punto de interés de América
                      const InterestPointWidget(
                        icon: Icons.terrain,
                        title: 'Datos de América',
                        description:
                            '42.5 millones km²\n1,000 millones de habitantes\nDesde Alaska hasta Argentina',
                        color: AppColors.interestAmber,
                      ),
                      const SizedBox(height: 40),
                      
                      // Botón para navegar a México
                      _buildMexicoButton(context),
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

  Widget _buildMexicoButton(BuildContext context) {
    return Hero(
      tag: 'mexico',
      child: GestureDetector(
        onTap: () => _navigateToCountry(context),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
          decoration: BoxDecoration(
            color: Colors.red.shade700,
            borderRadius: BorderRadius.circular(30),
            boxShadow: [
              BoxShadow(
                color: Colors.red.withOpacity(0.5),
                blurRadius: 20,
                spreadRadius: 3,
              ),
            ],
          ),
          child: const Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.flag, size: 40, color: Colors.white),
              SizedBox(width: 15),
              Text(
                '🇲🇽 MÉXICO',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _navigateToCountry(BuildContext context) {
    Navigator.push(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) =>
            const CountryScreen(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          const begin = Offset(1.0, 0.0);
          const end = Offset.zero;
          const curve = Curves.easeInOutCubic;
          var tween = Tween(begin: begin, end: end).chain(
            CurveTween(curve: curve),
          );
          return SlideTransition(
            position: animation.drive(tween),
            child: child,
          );
        },
        transitionDuration: const Duration(milliseconds: 700),
      ),
    );
  }
}