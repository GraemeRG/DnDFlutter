import 'package:dnd/models/race_list.dart';
import 'package:equatable/equatable.dart';

abstract class RaceListState extends Equatable {
  List<Object> get props => null;

  @override
  bool get stringify => true;
}

class RaceListLoadingState extends RaceListState {}

class RaceListErrorState extends RaceListState {
  final String error;

  RaceListErrorState(this.error);

  @override
  List<Object> get props => [error];
}

class RaceListSuccessState extends RaceListState {
  final RaceList list;

  RaceListSuccessState(this.list);

  @override
  List<Object> get props => [list];
}

class RaceListEmptyState extends RaceListState {
  final RaceList list;

  RaceListEmptyState(this.list);

  @override
  List<Object> get props => [list];
}