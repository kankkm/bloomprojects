import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:green_estate/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bloom Project',
      theme: ThemeData(
        primarySwatch: Colors.green,
        primaryColor: const Color(0xFF22382C),
        colorScheme: const ColorScheme.dark(
          primary: Color(0xFF22382C),
          secondary: Color(0xFF22382C),
          surface: Color(0xFFDCD5CD),
          background: Color(0xFFDCD5CD),
        ),
        textTheme: GoogleFonts.poppinsTextTheme(
          Theme.of(context).textTheme.apply(
            bodyColor: Colors.white,
            displayColor: Colors.white,
          ),
        ),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      debugShowCheckedModeBanner: false,
      home: const HomeScreen(),
    );
  }
}