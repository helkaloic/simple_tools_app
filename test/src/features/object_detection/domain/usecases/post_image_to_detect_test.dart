import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mocktail/mocktail.dart';
import 'package:simple_tools_app/src/features/object_detection/domain/entities/object_detection.dart';
import 'package:simple_tools_app/src/features/object_detection/domain/repositories/object_detection_repository.dart';
import 'package:simple_tools_app/src/features/object_detection/domain/usecases/post_image_to_detect.dart';

class MockObjectDetectionRepository extends Mock
    implements ObjectDetectionRepository {}

void main() {
  late MockObjectDetectionRepository mockObjectDetectionRepository;
  late PostImageToDetect postImageToDetect;

  setUp(() {
    mockObjectDetectionRepository = MockObjectDetectionRepository();
    postImageToDetect = PostImageToDetect(mockObjectDetectionRepository);
  });

  const tObjDetectionEntitiy = ObjectDetectionEntity(
    label: '',
    confidence: 0,
  );

  final tFile = XFile('/');

  test('should get object detection entity from repository', () async {
    // arrange
    when(() => mockObjectDetectionRepository.postImageToDetect(tFile))
        .thenAnswer(
      (_) async => const Right([tObjDetectionEntitiy]),
    );
    // act
    final result = await postImageToDetect(tFile);

    // assert
    expect(result, const Right([tObjDetectionEntitiy]));
  });
}
