import 'dart:convert' show jsonDecode;

import 'package:flutter/services.dart' show rootBundle;
import 'package:simple_tools_app/src/app/resources/assets.dart';
import 'package:simple_tools_app/src/features/tool/data/models/tool.dart';

abstract class ToolLocalDataSource {
  Future<List<ToolModel>> getTools();
}

class ToolLocalDataSourceImpl implements ToolLocalDataSource {
  @override
  Future<List<ToolModel>> getTools() async {
    final String jsonString = await rootBundle.loadString(AppJson.toolsInfo);
    final data = jsonDecode(jsonString)['tools'] as Iterable;
    return data
        .map((map) => ToolModel.fromJson(map as Map<String, dynamic>))
        .toList();
  }
}
