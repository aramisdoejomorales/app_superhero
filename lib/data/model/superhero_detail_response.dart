class SuperheroDetailResponse {
  final String id;
  final String name;

  SuperheroDetailResponse({required this.id, required this.name});

  factory SuperheroDetailResponse.fromJson(Map<String, dynamic> json) {
    return SuperheroDetailResponse(id: json["id"], name: json["name"]);
  }
}
