import 'dart:convert';

import 'package:http/http.dart' as http;

import 'model/superhero_response.dart';

class Repository {
  Future<SuperheroResponse?> fetchSuperhero(String name) async {
    final response = await http.get(
      Uri.parse(
        "https://superheroapi.com/api/eaad6887ad96a5dd41c02e9350b8fb17/search/$name",
      ),
    );
    if (response.statusCode == 200) {
      var decodeJson = jsonDecode(response.body);
      SuperheroResponse superheroResponse = SuperheroResponse.fromJson(
        decodeJson,
      );
      return superheroResponse;
    } else {
      //throw Exception("Failed to fetch superhero");
      return null;
    }
  }
}
