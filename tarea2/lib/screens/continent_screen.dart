import 'package:flutter/material.dart';
import '../widgets/title_widget.dart';
import '../widgets/interest_point_widget.dart';
import '../widgets/navigation_button.dart';
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
                title: '🌎 CONTINENTE AMERICANO',
                subtitle: 'De Alaska a la Patagonia',
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
                          icon: Icons.terrain,
                          title: 'Datos de América',
                          description:
                              '🗺️ 42.5 millones km²\n👥 1,000 millones de habitantes\n🏔️ Desde Alaska hasta Argentina\n🌴 Gran biodiversidad',
                          color: AppColors.interestAmber,
                        ),
                        const SizedBox(height: 30),
                        const InterestPointWidget(
                          icon: Icons.landscape,
                          title: 'Geografía Destacada',
                          description:
                              '🏔️ Cordillera de los Andes\n🌊 Amazonas: río más caudaloso\n🏜️ Desierto de Atacama',
                          color: AppColors.interestGreen,
                        ),
                        const SizedBox(height: 50),
                        
                        Hero(
                          tag: 'mexico',
                          child: NavigationButton(
                            text: '🇲🇽 MÉXICO',
                            icon: Icons.flag,
                            color: const Color(0xFFDC2626),
                            onTap: () => _navigateToCountry(context),
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