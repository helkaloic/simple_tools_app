import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';
import 'package:simple_tools_app/src/app/constants/app_url.dart';
import 'package:simple_tools_app/src/core/error/exception.dart';
import 'package:simple_tools_app/src/features/object_detection/data/models/object_detection.dart';

abstract class ObjectDetectionRemoteDataSource {
  /// Calls the https://api.api-ninjas.com/v1/objectdetection endpoint.
  ///
  /// Throw a [ServerException] for all server error codes.
  /// Throw a [DioException] for all Dio error codes.
  Future<List<ObjectDetectionModel>> postImageToDetect(XFile image);
}

class ObjectDetectionRemoteDataSourceImpl
    implements ObjectDetectionRemoteDataSource {
  final Dio dio;
  const ObjectDetectionRemoteDataSourceImpl({required this.dio});

  @override
  Future<List<ObjectDetectionModel>> postImageToDetect(XFile image) async {
    final options = Options(
      sendTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
      headers: {
        'X-Api-Key': 'YOUR_API_KEY',
        'Content-Type': 'multipart/form-data',
      },
    );

    final formData = FormData.fromMap({
      'image': await MultipartFile.fromFile(
        image.path,
        filename: image.name,
      ),
    });

    final response = await dio.post(
      AppUrls.urlObjDetect,
      options: options,
      data: formData,
    );

    if (response.statusCode == 200) {
      final data = response.data as Iterable<dynamic>;
      final objects = data
          .map((map) =>
              ObjectDetectionModel.fromJson(map as Map<String, dynamic>))
          .where((e) => e.confidence >= 0.4);

      final uniqueObjects = <String, ObjectDetectionModel>{};

      for (final obj in objects) {
        final existingObject = uniqueObjects[obj.label];

        if (existingObject == null ||
            obj.confidence > existingObject.confidence) {
          uniqueObjects[obj.label] = obj;
        }
      }

      return uniqueObjects.values.toList();
    } else {
      throw ServerException();
    }
  }
}
