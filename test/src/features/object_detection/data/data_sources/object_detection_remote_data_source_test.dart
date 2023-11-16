import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mocktail/mocktail.dart';
import 'package:simple_tools_app/src/core/error/exception.dart';
import 'package:simple_tools_app/src/features/object_detection/data/data_sources/object_detection_remote_data_source.dart';
import 'package:simple_tools_app/src/features/object_detection/data/models/object_detection.dart';

import '../../../../../helper/file_reader.dart';

class MockDio extends Mock implements Dio {}

void main() async {
  late ObjectDetectionRemoteDataSourceImpl remoteDataSourceImpl;
  late MockDio mockDio;

  final tFile = XFile(
    readFile(
      'test/src/features/object_detection/data/data_sources/room_object.jpg',
    ).path,
  );

  setUp(() {
    mockDio = MockDio();
    remoteDataSourceImpl = ObjectDetectionRemoteDataSourceImpl(
      dio: mockDio,
    );
  });

  group('object detection datasource test', () {
    test('should return object detection model from api', () async {
      // arrange
      when(() => mockDio.post(
            any(),
            data: any(named: 'data'),
            options: any(named: 'options'),
          )).thenAnswer((_) async => Response(
            requestOptions: RequestOptions(),
            data: jsonDecode(
              readJson(
                'test/src/features/object_detection/data/models/object_detection_result.json',
              ),
            ),
            statusCode: 200,
          ));
      // act
      final result = await remoteDataSourceImpl.postImageToDetect(tFile);

      // assert
      expect(result, isA<List<ObjectDetectionModel>>());
    });
    test('should throw server exception from api', () async {
      // arrange
      when(() => mockDio.post(
            any(),
            data: any(named: 'data'),
            options: any(named: 'options'),
          )).thenAnswer((_) async => Response(
            requestOptions: RequestOptions(),
            data: 'Server failed!',
            statusCode: 400,
          ));

      // assert
      expect(
        () async => await remoteDataSourceImpl.postImageToDetect(tFile),
        throwsA(isA<ServerException>()),
      );
    });
  });
}
