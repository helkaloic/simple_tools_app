import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mocktail/mocktail.dart';
import 'package:simple_tools_app/src/core/error/exception.dart';
import 'package:simple_tools_app/src/core/error/failure.dart';
import 'package:simple_tools_app/src/features/object_detection/data/data_sources/object_detection_remote_data_source.dart';
import 'package:simple_tools_app/src/features/object_detection/data/models/object_detection.dart';
import 'package:simple_tools_app/src/features/object_detection/data/repositories/object_detection_repository_impl.dart';
import 'package:simple_tools_app/src/features/object_detection/domain/entities/object_detection.dart';

class MockObjectDetectionRemoteDataSource extends Mock
    implements ObjectDetectionRemoteDataSource {}

void main() {
  late ObjectDetectionRepositoryImpl objectDetectionRepositoryImpl;
  late MockObjectDetectionRemoteDataSource mockDataSource;

  const tModels = [
    ObjectDetectionModel(
      label: '',
      confidence: 0,
    )
  ];
  const tEntities = [
    ObjectDetectionEntity(
      label: '',
      confidence: 0,
    )
  ];

  final tFile = XFile('/');

  setUp(() {
    mockDataSource = MockObjectDetectionRemoteDataSource();
    objectDetectionRepositoryImpl = ObjectDetectionRepositoryImpl(
      remoteDataSource: mockDataSource,
    );
  });

  group('object detection repository test', () {
    test('should return list of models from data source', () async {
      // arrange
      when(() => mockDataSource.postImageToDetect(tFile))
          .thenAnswer((_) async => tModels);
      // act
      final result =
          await objectDetectionRepositoryImpl.postImageToDetect(tFile);
      // assert
      result.fold(
        (l) => fail('Test failed'),
        (r) => expect(r, tEntities),
      );
    });
    test('should return connection failure from data source', () async {
      // arrange
      when(() => mockDataSource.postImageToDetect(tFile))
          .thenThrow(const SocketException(''));
      // act
      final result =
          await objectDetectionRepositoryImpl.postImageToDetect(tFile);
      // assert
      expect(
        result,
        equals(const Left(
          ConnectionFailure('Failed to connect to the internet.'),
        )),
      );
    });
    test('should return server failure from data source', () async {
      // arrange
      when(() => mockDataSource.postImageToDetect(tFile))
          .thenThrow(ServerException());
      // act
      final result =
          await objectDetectionRepositoryImpl.postImageToDetect(tFile);
      // assert
      expect(
        result,
        equals(const Left(
          ServerFailure('An error has occurred in the server.'),
        )),
      );
    });
    test('should return dio error from data source', () async {
      // arrange
      when(() => mockDataSource.postImageToDetect(tFile))
          .thenThrow(DioException(requestOptions: RequestOptions()));
      // act
      final result =
          await objectDetectionRepositoryImpl.postImageToDetect(tFile);
      // assert
      expect(
        result,
        equals(const Left(ServerFailure(''))),
      );
    });
  });
}
