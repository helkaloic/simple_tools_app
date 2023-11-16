import 'package:image_picker/image_picker.dart';
import 'package:simple_tools_app/src/core/typedef/typedefs.dart';
import 'package:simple_tools_app/src/features/object_detection/domain/entities/object_detection.dart';

abstract class ObjectDetectionRepository {
  FutureEither<List<ObjectDetectionEntity>> postImageToDetect(XFile image);
}
