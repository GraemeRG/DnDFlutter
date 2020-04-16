import 'dart:convert';

import 'package:dnd/api/web_service.dart';
import 'package:dnd/models/preview_list.dart';

abstract class PreviewListRepository {
  Future<PreviewList> spells();
  Future<PreviewList> classes();
  Future<PreviewList> races();
}

class DefaultPreviewListRepository implements PreviewListRepository {
  static const spellsUrl = 'http://dnd5eapi.co/api/spells';
  static const classesUrl = 'http://dnd5eapi.co/api/classes';
  static const racesUrl = 'http://dnd5eapi.co/api/races';
  final WebService webService;

  const DefaultPreviewListRepository(this.webService);

  Future<PreviewList> spells() async =>
      webService.executeGetRequest(spellsUrl).then((onValue) => _sanitise(onValue));

  Future<PreviewList> classes() async =>
      webService.executeGetRequest(classesUrl).then((onValue) => _sanitise(onValue));

  Future<PreviewList> races() async =>
      webService.executeGetRequest(racesUrl).then((onValue) => _sanitise(onValue));

  PreviewList _sanitise(String onValue) => PreviewList.fromJson(jsonDecode(onValue));


}
