import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';
import 'package:simple_tools_app/src/features/tool/domain/entities/tool.dart';
import 'package:simple_tools_app/src/features/tool/domain/repositories/tool_repository.dart';
import 'package:simple_tools_app/src/features/tool/domain/usecases/get_tool_info.dart';

class MockToolRepository extends Mock implements ToolRepository {}

void main() {
  late GetToolInfo getToolInfo;
  late MockToolRepository mockToolRepository;

  setUp(() {
    mockToolRepository = MockToolRepository();
    getToolInfo = GetToolInfo(repository: mockToolRepository);
  });

  const tToolEntities = [ToolEntity(title: '', body: '', icon: '', route: '')];

  test('should get list of tools from repository', () async {
    // arrange
    when(() => mockToolRepository.getToolsInfo())
        .thenAnswer((_) async => const Right(tToolEntities));
    // act
    final result = await getToolInfo();
    // assert
    expect(result, const Right(tToolEntities));
  });
}
