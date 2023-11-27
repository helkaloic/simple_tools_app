import 'package:simple_tools_app/src/core/typedef/typedefs.dart';
import 'package:simple_tools_app/src/features/tool/domain/entities/tool.dart';

abstract class ToolRepository {
  FutureEither<List<ToolEntity>> getToolsInfo();
}
