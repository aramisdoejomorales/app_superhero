import 'package:superhero_app/data/model/superhero_detail_response.dart';

class SuperheroResponse {
  final String response;
  final List<SuperheroDetailResponse> results;

  SuperheroResponse({required this.response, required this.results});

  factory SuperheroResponse.fromJson(Map<String, dynamic> json) {
    var list = json["results"] as List;
    List<SuperheroDetailResponse> heroList =
        list.map((hero) => SuperheroDetailResponse.fromJson(hero)).toList();

    return SuperheroResponse(response: json["response"], results: heroList);
  }
}
