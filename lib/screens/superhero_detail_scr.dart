import 'package:flutter/material.dart';
import 'package:superhero_app/data/model/superhero_detail_response.dart';

class SuperheroDetailScr extends StatelessWidget {
  final SuperheroDetailResponse superhero;
  const SuperheroDetailScr({super.key, required this.superhero});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Super Hero App'), centerTitle: true),
      body: Text("Super Heroe: ${superhero.name}"),
    );
  }
}
