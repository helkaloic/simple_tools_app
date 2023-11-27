import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../domain/entities/tool.dart';
import '../../domain/usecases/get_tool_info.dart';

part 'search_tool_event.dart';
part 'search_tool_state.dart';

class SearchToolBloc extends Bloc<SearchToolEvent, SearchToolState> {
  final GetToolInfo getToolInfo;

  SearchToolBloc(this.getToolInfo) : super(EmptySearchToolState()) {
    on<LoadAllToolsEvent>(_onLoadAllToolsEvent);
    on<SearchForToolsEvent>(_onSearchForToolEvent);
  }

  _onSearchForToolEvent(
    SearchForToolsEvent event,
    Emitter<SearchToolState> emit,
  ) async {
    emit(LoadingSearchToolState());

    final result = await getToolInfo();

    result.fold(
      (failure) => emit(ErrorSearchToolState(failure.message)),
      (list) {
        final result = list.where(
          (e) => e.title.toLowerCase().contains(event.value.toLowerCase()),
        );
        emit(LoadedSearchToolState(result.toList()));
      },
    );
  }

  _onLoadAllToolsEvent(
    LoadAllToolsEvent event,
    Emitter<SearchToolState> emit,
  ) async {
    emit(LoadingSearchToolState());

    final result = await getToolInfo();

    result.fold(
      (failure) => emit(ErrorSearchToolState(failure.message)),
      (list) => emit(LoadedSearchToolState(list)),
    );
  }
}
