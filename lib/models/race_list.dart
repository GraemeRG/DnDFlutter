import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class RaceList extends Equatable {
  int count;
  List<Race> results;

  RaceList.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    if(json['results'] != null) {
      results = new List<Race>();
      json['results'].forEach((v) {
        results.add(new Race.fromJson(v));
      });
    }
  }

  @override
  List<Object> get props => [count, results];
}

// ignore: must_be_immutable
class Race extends Equatable {
  String index;
  String name;
  String url;

  Race.fromJson(Map<String, dynamic> json) {
    index = json['index'];
    name = json['name'];
    url = json['url'];
  }

  @override
  List<Object> get props => [index, name, url];

  @override
  bool get stringify => true;
}