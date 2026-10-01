import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  
  // Fuerza la aplicación a ejecutarse únicamente en modo horizontal (Landscape)
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight,
  ]).then((_) {
    runApp(const PequeDesafiosApp());
  });
}

class PequeDesafiosApp extends StatelessWidget {
  const PequeDesafiosApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pequeños Desafíos',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.amber),
        useMaterial3: true,
      ),
      home: const MenuPrincipalScreen(),
    );
  }
}

class MenuPrincipalScreen extends StatelessWidget {
  const MenuPrincipalScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE3F2FD), // Azul tierno de fondo
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Pequeños Desafíos 🎮',
              style: TextStyle(
                fontSize: 42,
                fontWeight: FontWeight.bold,
                color: Color(0xFF1565C0),
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              '¡Aprende jugando en casa!',
              style: TextStyle(fontSize: 18, color: Colors.blueGrey),
            ),
            const SizedBox(height: 35),
            
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildBotonJuego(
                  context,
                  color: Colors.orangeAccent,
                  icono: '🦁',
                  texto: 'Contar Animales',
                ),
                const SizedBox(width: 30),
                _buildBotonJuego(
                  context,
                  color: Colors.lightGreen,
                  icono: '🧠',
                  texto: 'Memorama',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBotonJuego(BuildContext context, {required Color color, required String icono, required String texto}) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        elevation: 8,
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 25),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
        ),
      ),
      onPressed: () {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('¡Cargando el desafío de: $texto! ✨', style: const TextStyle(fontSize: 18)),
            duration: const Duration(seconds: 1),
          ),
        );
      },
      child: Column(
        children: [
          Text(icono, style: const TextStyle(fontSize: 45)),
          const SizedBox(height: 8),
          Text(
            texto,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}