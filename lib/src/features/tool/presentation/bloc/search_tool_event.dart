part of 'search_tool_bloc.dart';

sealed class SearchToolEvent extends Equatable {
  const SearchToolEvent();

  @override
  List<Object> get props => [];
}

class LoadAllToolsEvent extends SearchToolEvent {}

class SearchForToolsEvent extends SearchToolEvent {
  final String value;

  const SearchForToolsEvent(this.value);

  @override
  List<Object> get props => [value];
}
