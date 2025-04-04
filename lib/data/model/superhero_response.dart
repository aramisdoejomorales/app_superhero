class SuperheroResponse {
  final String response;

  SuperheroResponse({required this.response});
  factory SuperheroResponse.fromJson(Map<String, dynamic> json) {
    return SuperheroResponse(response: json["response"]);
  }
}
