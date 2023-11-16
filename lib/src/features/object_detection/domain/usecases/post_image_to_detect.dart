import 'package:image_picker/image_picker.dart';
import 'package:simple_tools_app/src/core/typedef/typedefs.dart';
import 'package:simple_tools_app/src/core/usecases/usecases.dart';
import 'package:simple_tools_app/src/features/object_detection/domain/entities/object_detection.dart';
import 'package:simple_tools_app/src/features/object_detection/domain/repositories/object_detection_repository.dart';

class PostImageToDetect extends Usecases<List<ObjectDetectionEntity>, XFile> {
  final ObjectDetectionRepository repository;

  PostImageToDetect(this.repository);

  @override
  FutureEither<List<ObjectDetectionEntity>> call(XFile params) async {
    return await repository.postImageToDetect(params);
  }
}
