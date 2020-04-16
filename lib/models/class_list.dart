import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class ClassList extends Equatable {
  int count;
  List<Class> results;

  @override
  List<Object> get props => [count, results];

}

// ignore: must_be_immutable
class Class extends Equatable {
  String index;
  String name;
  String url;

  Class.fromJson(Map<String, dynamic> json) {
    index = json['index'];
    name = json['name'];
    url = json['url'];
  }

  @override
  List<Object> get props => [index, name, url];

  @override
  bool get stringify => true;
}