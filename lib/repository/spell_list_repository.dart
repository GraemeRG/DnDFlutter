import 'dart:convert';

import 'package:dnd/api/web_service.dart';
import 'package:dnd/models/spell_list.dart';

abstract class SpellListRepository {
  Future<SpellList> spells();
}

class DefaultSpellListRepository implements SpellListRepository {
  static const uril = 'http://dnd5eapi.co/api/spells';
  final WebService webService;

  const DefaultSpellListRepository(this.webService);

  Future<SpellList> spells() async =>
      webService.executeGetRequest(uril).then((onValue) => _sanitise(onValue));

  SpellList _sanitise(String onValue) => SpellList.fromJson(jsonDecode(onValue));
}
