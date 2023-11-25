import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:simple_tools_app/src/features/object_detection/data/models/object_detection.dart';
import 'package:simple_tools_app/src/features/object_detection/domain/entities/object_detection.dart';

import '../../../../../helper/file_reader.dart';
import '../../../../app/resources/assets.dart';

void main() {
  const tObjectDetectionModel = ObjectDetectionModel(
    label: 'bed',
    confidence: 0.79,
  );

  const tObjectDetectionEntity = ObjectDetectionEntity(
    label: 'bed',
    confidence: 0.79,
  );

  test('should be a child class of object detection entity', () {
    expect(tObjectDetectionModel, isA<ObjectDetectionEntity>());
  });

  test('should return object detection entity', () {
    // act
    final result = tObjectDetectionModel.toEntity();
    // assert
    expect(
      result,
      equals(tObjectDetectionEntity),
    );
  });

  test('should return object detection model from json', () {
    // arrange
    Iterable<dynamic> tJson = jsonDecode(
      readJson(AppJsonTest.detectionResult),
    );
    // act
    final result =
        ObjectDetectionModel.fromJson(tJson.first as Map<String, dynamic>);
    // assert
    expect(result, tObjectDetectionModel);
  });

  test('should return json from object detection model', () {
    // arrange
    final tJson = {"confidence": 0.79, "label": "bed"};
    // act
    final result = tObjectDetectionModel.toJson();
    // assert
    expect(result, equals(tJson));
  });
}
