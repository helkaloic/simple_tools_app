import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';
import 'package:simple_tools_app/src/features/tool/domain/entities/tool.dart';
import 'package:simple_tools_app/src/features/tool/domain/usecases/search_for_tool.dart';

import 'get_tool_info_test.dart';

void main() {
  late SearchForTool searchForTool;
  late MockToolRepository mockToolRepository;

  setUp(() {
    mockToolRepository = MockToolRepository();
    searchForTool = SearchForTool(repository: mockToolRepository);
  });

  const tToolEntities = [ToolEntity(title: '', body: '', icon: '', route: '')];

  test('should get tool entity from repo', () async {
    when(() => mockToolRepository.searchForTool('test'))
        .thenAnswer((_) async => const Right(tToolEntities));
    final result = await searchForTool('test');
    expect(result, equals(const Right(tToolEntities)));
  });
}
