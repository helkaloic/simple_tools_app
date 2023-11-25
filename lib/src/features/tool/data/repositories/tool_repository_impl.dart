import 'package:fpdart/fpdart.dart';
import 'package:simple_tools_app/src/core/error/failure.dart';
import 'package:simple_tools_app/src/core/typedef/typedefs.dart';
import 'package:simple_tools_app/src/features/tool/data/data_sources/tool_local_data_source.dart';
import 'package:simple_tools_app/src/features/tool/domain/entities/tool.dart';
import 'package:simple_tools_app/src/features/tool/domain/repositories/tool_repository.dart';

class ToolRepositoryImpl implements ToolRepository {
  final ToolLocalDataSource dataSource;

  ToolRepositoryImpl({required this.dataSource});

  @override
  FutureEither<List<ToolEntity>> getToolsInfo() async {
    try {
      final result = await dataSource.getTools();
      return Right(result.map((e) => e.toEntity()).toList());
    } on UnimplementedError {
      return const Left(UnhandleFailure('Fail to read tools list.'));
    }
  }
}
