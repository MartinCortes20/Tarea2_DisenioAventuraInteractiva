#🌍 Aventura Geográfica - Android App
📱 Descripción de la Aplicación
Aventura Geográfica es una aplicación Android que ofrece una experiencia inmersiva de exploración mundial a través de una jerarquía de navegación de tres niveles. Los usuarios pueden viajar desde una vista global del mundo hasta continentes específicos y finalmente explorar países individuales con sus puntos de interés más destacados.
🎯 Características Principales

Navegación Jerárquica de 3 Niveles: Mundo → Continente → País
Diseños Visuales Únicos: Cada pantalla tiene una identidad visual distintiva
Puntos de Interés Interactivos: Información detallada sobre lugares emblemáticos
Transiciones Creativas: Animaciones y efectos que simulan un viaje geográfico
Interfaz Inmersiva: Experiencia de usuario temática y envolvente

##🏗️ Estructura del Proyecto
lib/
├── constants/
│   └── app_colors.dart
├── models/
│   └── place_info.dart
├── screens/
│   ├── world_map_screen.dart
│   ├── continent_screen.dart
│   ├── country_screen.dart
│   └── city_screen.dart
├── widgets/
│   ├── interest_point_widget.dart
│   ├── navigation_button.dart
│   └── title_widget.dart
└── main.dart
##🚀 Instrucciones de Ejecución
Prerrequisitos

Flutter SDK (versión 3.0 o superior)
Dart SDK
Android Studio o VS Code
Dispositivo Android o emulador

Pasos para Ejecutar el Proyecto

Clonar el Repositorio

bash   git clone https://github.com/MartinCortes20/Tarea2_DisenioAventuraInteractiva
   cd aventura-geografica

Instalar Dependencias

bash   flutter pub get

Ejecutar la Aplicación

bash   flutter run

Construir APK (Opcional)

bash   flutter build apk --release
##🎨 Decisiones de Diseño
Arquitectura de Navegación

WorldMapScreen: Vista global con mapa mundial interactivo
ContinentScreen: Enfoque en continentes específicos con detalles regionales
CountryScreen: Exploración profunda de países individuales
CityScreen: Detalles de ciudades y puntos de interés

Diseño Visual por Nivel

Nivel Mundial: Fondos azules que representan océanos, diseño minimalista
Nivel Continental: Colores y texturas que reflejan la geografía del continente
Nivel País: Elementos culturales y colores representativos de cada nación

Widgets Personalizados

InterestPointWidget: Muestra información interactiva sobre lugares emblemáticos
NavigationButton: Botones de navegación con animaciones temáticas
TitleWidget: Encabezados consistentes en toda la aplicación

##🔄 Mecanismos de Transición
Transiciones Implementadas

Zoom Geográfico: Al seleccionar un continente, la animación simula un acercamiento desde el mapa mundial
Desplazamiento Suave: Transiciones fluidas entre pantallas con efectos de parallax
Animaciones Temáticas: Efectos que reflejan movimiento de globo terráqueo y exploración
Feedback Visual: Respuesta táctil inmediata en puntos interactivos

Puntos de Interés

Implementados en todos los niveles de la jerarquía
Información mostrada mediante modales y tarjetas expandibles
Contienen texto descriptivo, imágenes y datos relevantes
Activados por gestos de toque en elementos interactivos


##📸 Capturas de Pantalla

Pantalla del Mapa Mundial - Vista global con continentes interactivos
<img width="346" height="728" alt="Captura de pantalla 2025-09-29 a la(s) 2 04 19 a m" src="https://github.com/user-attachments/assets/d4d70d27-46d6-4803-9c90-3bccbb53f692" />

Pantalla de Continente - Enfoque en un continente específico con países destacados
<img width="346" height="728" alt="Captura de pantalla 2025-09-29 a la(s) 2 04 36 a m" src="https://github.com/user-attachments/assets/f6a1a746-5fbb-4197-97e7-3bb2535a0702" />

Pantalla de País - Detalles del país seleccionado con puntos de interés
<img width="346" height="728" alt="Captura de pantalla 2025-09-29 a la(s) 2 04 49 a m" src="https://github.com/user-attachments/assets/2207503f-cb3a-4b35-b475-c6bb7eb0fa3e" />

Puntos de Interés - Modal con información detallada de lugares emblemáticos
<img width="346" height="728" alt="Captura de pantalla 2025-09-29 a la(s) 2 05 03 a m" src="https://github.com/user-attachments/assets/07eee4eb-4a2a-49c6-be4a-4284b64f5219" />
