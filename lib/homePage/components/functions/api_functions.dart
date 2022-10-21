import 'package:dio/dio.dart';

class Api {
  Future<List<Person>> getApi(int page) async {
    var response = await Dio()
        .get("https://rickandmortyapi.com/api/character/?page=$page");
    List user = response.data['results'];

    return user.map((e) => Person.fromJson(e)).toList();
  }

  Future<ResponseData> getSearch(String value, int page) async {
    var response = await Dio().get(
        "https://rickandmortyapi.com/api/character/?page=$page&name=$value");

    ResponseData resp = ResponseData.fromJson(response.data);

    return resp;
  }
}

class Person {
  //modal class for Person object

  String? name, status, species, type, gender, image, created;
  late List episodes;
  Person(
      {required this.status,
      required this.name,
      required this.species,
      required this.type,
      required this.gender,
      required this.image,
      required this.created,
      required this.episodes});

  Person.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    status = json['status'];
    species = json['species'];
    type = json['type'];
    gender = json['gender'];
    image = json['image'];
    created = json['created'];
    episodes = json['episode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['name'] = name;
    data['status'] = status;
    data['species'] = species;
    data['type'] = type;
    data['gender'] = gender;
    data['image'] = image;
    data['created'] = created;
    data['episodes'] = episodes;

    return data;
  }
}

class ResponseData {
  Info? info;
  List<dynamic>? results;
  List<Person>? person;

  ResponseData({required this.info, required this.results});

  ResponseData.fromJson(Map<String, dynamic> json) {
    info = Info.fromJson(json['info']);
    results = json['results'];

    if (results != null) {
      person = results!.map((e) => Person.fromJson(e)).toList();
    }
  }
}

class Info {
  int? count, pages;

  Info({
    required this.count,
    required this.pages,
  });

  Info.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    pages = json['pages'];
  }
}
