part of 'search_tool_bloc.dart';

sealed class SearchToolEvent extends Equatable {
  const SearchToolEvent();

  @override
  List<Object> get props => [];
}

class LoadAllToolsEvent extends SearchToolEvent {}
