import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class SpellList extends Equatable {
  int count;
  List<Spell> results;

  SpellList.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    if(json['results'] != null) {
      results = new List<Spell>();
      json['results'].forEach((v) {
        results.add(new Spell.fromJson(v));
      });
    }
  }

  @override
  List<Object> get props => [count, results];
}

// ignore: must_be_immutable
class Spell extends Equatable {
  String index;
  String name;
  String url;

  Spell.fromJson(Map<String, dynamic> json) {
    index = json['index'];
    name = json['name'];
    url = json['url'];
  }

  @override
  List<Object> get props => [index, name, url];

  @override
  bool get stringify => true;
}