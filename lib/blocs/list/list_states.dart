import 'package:dnd/models/preview_list.dart';
import 'package:equatable/equatable.dart';

abstract class PreviewListState extends Equatable {
  List<Object> get props => null;

  @override
  bool get stringify => true;
}

class ListLoadingState extends PreviewListState {}

class ListErrorState extends PreviewListState {
  final String error;

  ListErrorState(this.error);

  @override
  List<Object> get props => [error];
}

class ListSuccessState extends PreviewListState {
  final PreviewList list;

  ListSuccessState(this.list);

  @override
  List<Object> get props => [list];
}

class ListEmptyState extends PreviewListState {
  final PreviewList list;

  ListEmptyState(this.list);

  @override
  List<Object> get props => [list];
}