import 'package:flutter/material.dart';
import '../widgets/title_widget.dart';
import '../widgets/interest_point_widget.dart';
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
              _buildBackButton(context),
              const TitleWidget(
                title: '🇲🇽 MÉXICO',
                subtitle: 'Descubre la capital del país',
              ),
              Expanded(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Punto de interés de México
                      const InterestPointWidget(
                        icon: Icons.museum,
                        title: 'República Mexicana',
                        description:
                            '128 millones de habitantes\n1.96 millones km²\n32 estados\nRico patrimonio cultural',
                        color: AppColors.interestPurple,
                      ),
                      const SizedBox(height: 40),
                      
                      // Botón para navegar a CDMX
                      _buildCdmxButton(context),
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
          icon: const Icon(Icons.arrow_back, size: 30),
          onPressed: () => Navigator.pop(context),
        ),
      ],
    );
  }

  Widget _buildCdmxButton(BuildContext context) {
    return Hero(
      tag: 'cdmx',
      child: GestureDetector(
        onTap: () => _navigateToCity(context),
        child: Container(
          width: 250,
          height: 250,
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [Color(0xFFEC4899), Color(0xFF8B5CF6)],
            ),
            borderRadius: BorderRadius.circular(30),
            boxShadow: [
              BoxShadow(
                color: Colors.purple.withOpacity(0.6),
                blurRadius: 30,
                spreadRadius: 5,
              ),
            ],
          ),
          child: const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.location_city, size: 80, color: Colors.white),
              SizedBox(height: 15),
              Text(
                'CIUDAD DE',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
              Text(
                'MÉXICO',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
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
