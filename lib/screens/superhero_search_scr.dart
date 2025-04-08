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

  Padding itemSuperhero(SuperheroDetailResponse item) => Padding(
    padding: EdgeInsets.only(left: 16.0, right: 16.0, top: 8.0, bottom: 8.0),
    child: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.red,
      ),

      child: Column(
        children: [
          Image.network(
            item.url,
            height: 250,
            width: double.infinity,
            fit: BoxFit.cover,
            alignment: Alignment(0.0, -0.5),
          ),
          Text(
            item.name,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ],
      ),
    ),
  );
}
