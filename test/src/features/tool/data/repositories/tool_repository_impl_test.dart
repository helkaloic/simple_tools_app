import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';
import 'package:simple_tools_app/src/core/error/failure.dart';
import 'package:simple_tools_app/src/features/tool/data/data_sources/tool_local_data_source.dart';
import 'package:simple_tools_app/src/features/tool/data/models/tool.dart';
import 'package:simple_tools_app/src/features/tool/data/repositories/tool_repository_impl.dart';
import 'package:simple_tools_app/src/features/tool/domain/entities/tool.dart';

class MockToolLocalDataSource extends Mock implements ToolLocalDataSourceImpl {}

void main() {
  late ToolRepositoryImpl toolRepositoryImpl;
  late MockToolLocalDataSource mockToolLocalDataSource;

  setUp(() {
    mockToolLocalDataSource = MockToolLocalDataSource();
    toolRepositoryImpl =
        ToolRepositoryImpl(dataSource: mockToolLocalDataSource);
  });

  const tToolEntities = [ToolEntity(title: '', body: '', icon: '', route: '')];
  const tToolModels = [ToolModel(title: '', body: '', icon: '', route: '')];

  group('tool repository impl test', () {
    test('should return list of tool object', () async {
      when(() => mockToolLocalDataSource.getTools())
          .thenAnswer((_) async => tToolModels);
      final result = await toolRepositoryImpl.getToolsInfo();
      result.fold(
        (l) => fail('failed'),
        (r) => expect(r, tToolEntities),
      );
    });

    test('should return failure', () async {
      when(() => mockToolLocalDataSource.getTools())
          .thenThrow(UnimplementedError());
      final result = await toolRepositoryImpl.getToolsInfo();
      expect(
        result,
        equals(const Left(UnhandleFailure('Fail to read tools list.'))),
      );
    });
  });
}
