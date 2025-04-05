import 'package:flutter/material.dart';
import 'package:superhero_app/data/model/superhero_detail_response.dart';

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
                  borderSide: BorderSide(color: Colors.redAccent, width: 4.0),
                ),
              ),
              onChanged: (value) {
                setState(() {
                  _superheroInfo = repository.fetchSuperhero(value);
                });
              },
            ),
          ),
          bodyList(),
        ],
      ),
    );
  }

  FutureBuilder<SuperheroResponse?> bodyList() {
    return FutureBuilder(
      future: _superheroInfo,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          var superheroList = snapshot.data?.results;
          return Expanded(
            child: ListView.builder(
              itemCount: superheroList?.length ?? 0,
              itemBuilder: (context, index) {
                if (superheroList != null) {
                  return itemSuperhero(superheroList[index]);
                } else {
                  return Text('No data');
                }
              },
            ),
          );
        } else if (snapshot.hasError) {
          return Text(snapshot.error.toString());
        } else if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        } else {
          return Text('No data');
        }
      },
    );
  }

  Column itemSuperhero(SuperheroDetailResponse item) => Column();
}
