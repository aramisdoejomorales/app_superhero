import 'package:flutter/material.dart';

import '../data/model/superhero_response.dart';
import '../data/repository.dart';

class SuperheroSearchScr extends StatefulWidget {
  const SuperheroSearchScr({super.key});

  @override
  State<SuperheroSearchScr> createState() => _SuperheroSearchScrState();
}

class _SuperheroSearchScrState extends State<SuperheroSearchScr> {
  Future<SuperheroResponse?>? _superheroInfo;
  Repository repository = Repository();

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
                setState(() {
                  _superheroInfo = repository.fetchSuperhero(value);
                });
              },
            ),
          ),
          FutureBuilder(
            future: _superheroInfo,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Text(snapshot.data!.response);
              } else if (snapshot.hasError) {
                return Text(snapshot.error.toString());
              } else if (snapshot.connectionState == ConnectionState.waiting) {
                return CircularProgressIndicator();
              } else {
                return Text('No data');
              }
            },
          ),
        ],
      ),
    );
  }
}
