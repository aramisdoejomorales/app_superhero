import 'package:flutter/material.dart';

class SuperheroSearchScr extends StatefulWidget {
  const SuperheroSearchScr({super.key});

  @override
  State<SuperheroSearchScr> createState() => _SuperheroSearchScrState();
}

class _SuperheroSearchScrState extends State<SuperheroSearchScr> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Super Hero App'), centerTitle: true),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search for a superhero',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue, width: 4.0),
                ),
              ),
              onChanged: (value) {
                // Handle search input
              },
            ),
          ),
        ],
      ),
    );
  }
}
