import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:simple_tools_app/src/features/tool/domain/entities/tool.dart';
import 'package:simple_tools_app/src/features/tool/domain/usecases/get_tool_info.dart';
import 'package:simple_tools_app/src/features/tool/domain/usecases/search_for_tool.dart';

part 'search_tool_event.dart';
part 'search_tool_state.dart';

class SearchToolBloc extends Bloc<SearchToolEvent, SearchToolState> {
  final GetToolInfo getToolInfo;
  final SearchForTool searchForTool;

  SearchToolBloc(
    this.getToolInfo,
    this.searchForTool,
  ) : super(EmptySearchToolState()) {
    on<LoadAllToolsEvent>(_onLoadAllToolsEvent);
    on<SearchForToolsEvent>(_onSearchForToolEvent);
  }

  _onSearchForToolEvent(
    SearchForToolsEvent event,
    Emitter<SearchToolState> emit,
  ) async {
    emit(LoadingSearchToolState());

    final result = await searchForTool(event.value);

    result.fold(
      (failure) => emit(ErrorSearchToolState(failure.message)),
      (list) => emit(LoadedSearchToolState(list)),
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
