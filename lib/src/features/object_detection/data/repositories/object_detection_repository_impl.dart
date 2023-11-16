import 'dart:io';

import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import 'package:image_picker/image_picker.dart';
import 'package:simple_tools_app/src/core/error/exception.dart';
import 'package:simple_tools_app/src/core/error/failure.dart';
import 'package:simple_tools_app/src/core/typedef/typedefs.dart';
import 'package:simple_tools_app/src/features/object_detection/data/data_sources/object_detection_remote_data_source.dart';
import 'package:simple_tools_app/src/features/object_detection/domain/entities/object_detection.dart';
import 'package:simple_tools_app/src/features/object_detection/domain/repositories/object_detection_repository.dart';

class ObjectDetectionRepositoryImpl implements ObjectDetectionRepository {
  final ObjectDetectionRemoteDataSource remoteDataSource;

  const ObjectDetectionRepositoryImpl({
    required this.remoteDataSource,
  });

  @override
  FutureEither<List<ObjectDetectionEntity>> postImageToDetect(
      XFile image) async {
    try {
      final remoteObjectDetection =
          await remoteDataSource.postImageToDetect(image);

      final entites = remoteObjectDetection.map((e) => e.toEntity()).toList();
      return Right(entites);
    } on SocketException {
      return const Left(
        ConnectionFailure('Failed to connect to the internet.'),
      );
    } on ServerException {
      return const Left(
        ServerFailure('An error has occurred in the server.'),
      );
    } on DioException catch (e) {
      return Left(
        ServerFailure(e.response?.data['error'] ?? ''),
      );
    }
  }
}
