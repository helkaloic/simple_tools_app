import 'package:simple_tools_app/src/core/typedef/typedefs.dart';
import 'package:simple_tools_app/src/core/usecases/usecases.dart';
import 'package:simple_tools_app/src/features/tool/domain/entities/tool.dart';
import 'package:simple_tools_app/src/features/tool/domain/repositories/tool_repository.dart';

class SearchForTool extends Usecases<List<ToolEntity>, String> {
  final ToolRepository repository;

  SearchForTool({required this.repository});

  @override
  FutureEither<List<ToolEntity>> call(String params) async {
    return await repository.searchForTool(params.toLowerCase());
  }
}
