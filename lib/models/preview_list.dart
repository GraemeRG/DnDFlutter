import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class PreviewList extends Equatable {
  int count;
  List<Preview> results;

  PreviewList.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    if(json['results'] != null) {
      results = new List<Preview>();
      json['results'].forEach((v) {
        results.add(new Preview.fromJson(v));
      });
    }
  }

  @override
  List<Object> get props => [count, results];
}

// ignore: must_be_immutable
class Preview extends Equatable {
  String index;
  String name;
  String url;

  Preview.fromJson(Map<String, dynamic> json) {
    index = json['index'];
    name = json['name'];
    url = json['url'];
  }

  @override
  List<Object> get props => [index, name, url];

  @override
  bool get stringify => true;
}