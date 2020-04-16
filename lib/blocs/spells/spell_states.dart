import 'package:dnd/models/spell_list.dart';
import 'package:equatable/equatable.dart';

abstract class SpellListState extends Equatable {
  List<Object> get props => null;

  @override
  bool get stringify => true;
}

class SpellListLoadingState extends SpellListState {}

class SpellListErrorState extends SpellListState {
  final String error;

  SpellListErrorState(this.error);

  @override
  List<Object> get props => [error];
}

class SpellListSuccessState extends SpellListState {
  final SpellList list;

  SpellListSuccessState(this.list);

  @override
  List<Object> get props => [list];
}

class SpellListEmptyState extends SpellListState {
  final SpellList list;

  SpellListEmptyState(this.list);

  @override
  List<Object> get props => [list];
}