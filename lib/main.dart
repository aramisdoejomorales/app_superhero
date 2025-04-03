import 'package:flutter/material.dart';
import 'package:superhero_app/screens/superhero_search_scr.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Super Hero App',
      home: SuperheroSearchScr(),
    );
  }
}
