import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:simple_tools_app/src/features/tool/data/models/tool.dart';
import 'package:simple_tools_app/src/features/tool/domain/entities/tool.dart';

import '../../../../../helper/file_reader.dart';
import '../../../../app/resources/assets.dart';

void main() {
  const tToolModel = ToolModel(title: '', body: '', icon: '', route: '');
  const tToolEntity = ToolEntity(title: '', body: '', icon: '', route: '');

  test('should be a sub class', () {
    expect(tToolModel, isA<ToolEntity>());
  });

  test('should return entity class', () {
    final result = tToolModel.toEntity();
    expect(result, equals(tToolEntity));
  });

  test('should return valid model', () {
    final json = jsonDecode(readJson(AppJsonTest.toolJson));
    final result = ToolModel.fromJson(json);
    expect(result, equals(tToolModel));
  });

  test('should return valid json', () {
    final tJson = {"body": "", "icon": "", "title": "", "route": ""};
    final result = tToolModel.toJson();
    expect(result, equals(tJson));
  });
}
