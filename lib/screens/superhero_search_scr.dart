import 'package:flutter/material.dart';
import 'package:superhero_app/data/model/superhero_detail_response.dart';
import 'package:superhero_app/screens/superhero_detail_scr.dart';

import '../data/model/superhero_response.dart';
import '../data/repository.dart';

class SuperheroSearchScr extends StatefulWidget {
  const SuperheroSearchScr({super.key});

  @override
  State<SuperheroSearchScr> createState() => _SuperheroSearchScrState();
}

class _SuperheroSearchScrState extends State<SuperheroSearchScr> {
  Future<SuperheroResponse?>? _superheroInfo;
  final Repository _repository = Repository();
  bool _isTextEmpty = true;

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
                  _isTextEmpty = value.isEmpty;
                  _superheroInfo = _repository.fetchSuperhero(value);
                });
              },
            ),
          ),
          bodyList(_isTextEmpty),
        ],
      ),
    );
  }

  FutureBuilder<SuperheroResponse?> bodyList(bool isTextEmpty) {
    return FutureBuilder(
      future: _superheroInfo,
      builder: (context, snapshot) {
        if (isTextEmpty) {
          return Center(child: Text('Introduzca un nombre de superhéroe'));
        }
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
    child: GestureDetector(
      onTap:
          () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => SuperheroDetailScr(superhero: item),
            ),
          ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.red,
        ),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.network(
                item.url,
                height: 250,
                width: double.infinity,
                fit: BoxFit.cover,
                alignment: Alignment(0.0, -0.5),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                item.name,
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w300,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
