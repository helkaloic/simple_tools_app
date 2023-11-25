part of 'search_tool_bloc.dart';

sealed class SearchToolState extends Equatable {
  const SearchToolState();

  @override
  List<Object> get props => [];
}

final class EmptySearchToolState extends SearchToolState {}

final class LoadingSearchToolState extends SearchToolState {}

final class LoadedSearchToolState extends SearchToolState {
  final List<ToolEntity> list;

  const LoadedSearchToolState(this.list);
}

final class ErrorSearchToolState extends SearchToolState {
  final String message;

  const ErrorSearchToolState(this.message);
}
