import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:simple_tools_app/src/core/utils/connection_checker.dart';
import 'package:simple_tools_app/src/core/utils/file_checker.dart';
import 'package:simple_tools_app/src/features/object_detection/domain/usecases/post_image_to_detect.dart';
import 'package:simple_tools_app/src/features/object_detection/presentation/blocs/object_detection/object_detection_bloc.dart';

class MockPostImageToDetect extends Mock implements PostImageToDetect {}

class MockFileChecker extends Mock implements FileChecker {}

class MockConnectionChecker extends Mock implements ConnectionChecker {}

void main() {
  late ObjectDetectionBloc objectDetectionBloc;
  late MockPostImageToDetect mockPostImageToDetect;
  late MockFileChecker mockFileChecker;
  late MockConnectionChecker mockConnectionChecker;

  setUp(() {
    mockPostImageToDetect = MockPostImageToDetect();
    mockFileChecker = MockFileChecker();
    mockConnectionChecker = MockConnectionChecker();
    objectDetectionBloc = ObjectDetectionBloc(
      mockPostImageToDetect,
      mockFileChecker,
      mockConnectionChecker,
    );
  });

  // final tFile = XFile(
  //   readFile(AppImageTest.roomObject).path,
  // );

  // final tList = [
  //   const ObjectDetectionEntity(label: '', confidence: 0),
  // ];

  test('should return empty object detection state', () {
    expect(objectDetectionBloc.state, EmptyDetectionState());
  });

  // blocTest<ObjectDetectionBloc, ObjectDetectionState>(
  //   'emits [LoadingDetectionState] & [LoadedDetectionState] when SubmitImageToDetectEvent is added.',
  //   build: () {
  //     when(() => mockPostImageToDetect(tFile))
  //         .thenAnswer((_) async => Right(tList));
  //     return objectDetectionBloc;
  //   },
  //   act: (bloc) => bloc.add(SubmitImageToDetectObjectEvent(imgFile: tFile)),
  //   expect: () => <ObjectDetectionState>[
  //     LoadingDetectionState(),
  //     LoadedDetectionState(list: tList)
  //   ],
  // );

  // blocTest<ObjectDetectionBloc, ObjectDetectionState>(
  //   'emits [LoadingDetectionState] & [ErrorDetectionState] when SubmitImageToDetectEvent is added.',
  //   build: () {
  //     when(() => mockPostImageToDetect(tFile)).thenAnswer((_) async =>
  //         const Left(ServerFailure('An error has occurred in the server.')));
  //     return objectDetectionBloc;
  //   },
  //   act: (bloc) => bloc.add(SubmitImageToDetectObjectEvent(imgFile: tFile)),
  //   expect: () => <ObjectDetectionState>[
  //     LoadingDetectionState(),
  //     const ErrorDetectionState(message: 'An error has occurred in the server.')
  //   ],
  // );
}
