import 'dart:convert';

import 'package:dnd/api/web_service.dart';
import 'package:dnd/models/race_list.dart';

abstract class RaceListRepository {
  Future<RaceList> races();
}

class DefaultRaceListRepository implements RaceListRepository {
  static const url = 'http://dnd5eapi.co/api/races';
  final WebService webService;

  const DefaultRaceListRepository(this.webService);

  Future<RaceList> races() async =>
      webService.executeGetRequest(url).then((onValue) => _sanitise(onValue));

  RaceList _sanitise(String onValue) => RaceList.fromJson(jsonDecode(onValue));
}
