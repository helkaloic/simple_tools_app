import 'package:simple_tools_app/src/core/typedef/typedefs.dart';
import 'package:simple_tools_app/src/core/usecases/usecases.dart';
import 'package:simple_tools_app/src/features/tool/domain/entities/tool.dart';
import 'package:simple_tools_app/src/features/tool/domain/repositories/tool_repository.dart';

class GetToolInfo extends UsecasesNoParam<List<ToolEntity>> {
  final ToolRepository repository;

  GetToolInfo({required this.repository});

  @override
  FutureEither<List<ToolEntity>> call() async {
    return await repository.getToolsInfo();
  }
}
