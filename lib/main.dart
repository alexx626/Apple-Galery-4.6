import 'dart:async';
import 'package:flutter/material.dart';

void main() => runApp(const AleXx626App());

class AleXx626App extends StatelessWidget {
  const AleXx626App({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AleXx626',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.amber),
        useMaterial3: true,
      ),
      home: const SplashGate(),
    );
  }
}

class SplashGate extends StatefulWidget {
  const SplashGate({super.key});
  @override
  State<SplashGate> createState() => _SplashGateState();
}

class _SplashGateState extends State<SplashGate> with SingleTickerProviderStateMixin {
  late AnimationController _ctrl;
  late Animation<double> _zoom;

  @override
  void initState() {
    super.initState();
    _ctrl = AnimationController(vsync: this, duration: const Duration(seconds: 2));
    _zoom = Tween<double>(begin: 1.0, end: 1.06).animate(
      CurvedAnimation(parent: _ctrl, curve: Curves.easeInOut),
    );
    _ctrl.forward();
    Timer(const Duration(seconds: 2), () {
      if (mounted) Navigator.of(context).pushReplacement(
        PageRouteBuilder(
          pageBuilder: (_, __, ___) => const HomeScreen(),
          transitionsBuilder: (_, anim, __, child) =>
            FadeTransition(opacity: anim, child: child),
          transitionDuration: const Duration(milliseconds: 400),
        ),
      );
    });
  }

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(fit: StackFit.expand, children: [
        AnimatedBuilder(
          animation: _zoom,
          builder: (_, __) => Transform.scale(
            scale: _zoom.value,
            child: Image.asset('assets/splash.jpg', fit: BoxFit.cover),
          ),
        ),
        const DecoratedBox(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.center,
              end: Alignment.bottomCenter,
              colors: [Colors.transparent, Color(0x40000000)],
            ),
          ),
        ),
      ]),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('AleXx626 Gallery')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const Text('Home screen mock', style: TextStyle(fontSize: 18, color: Colors.black54)),
          const SizedBox(height: 16),
          Wrap(spacing: 12, runSpacing: 12, children: const [
            _Tile(label: 'Albums', icon: Icons.grid_view_rounded),
            _Tile(label: 'Favorites', icon: Icons.star_rounded),
            _Tile(label: 'Hidden', icon: Icons.visibility_off_rounded),
            _Tile(label: 'Settings', icon: Icons.settings_rounded),
          ]),
          const Spacer(),
          const Text('Tip: imaginea din splash e în assets/splash.jpg',
              style: TextStyle(fontSize: 12, color: Colors.black38)),
        ]),
      ),
    );
  }
}

class _Tile extends StatelessWidget {
  final String label; final IconData icon;
  const _Tile({required this.label, required this.icon});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 160, height: 100,
      decoration: BoxDecoration(
        color: Colors.amber.shade50, borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.amber.shade200),
      ),
      child: Center(child: Column(mainAxisSize: MainAxisSize.min, children: [
        Icon(icon, size: 28, color: Colors.amber.shade800),
        const SizedBox(height: 8),
        Text(label, style: TextStyle(fontWeight: FontWeight.w600, color: Colors.amber.shade900)),
      ])),
    );
  }
}
