import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mocktail/mocktail.dart';
import 'package:simple_tools_app/src/features/object_detection/presentation/bloc/pick_image/pick_image_bloc.dart';

class MockImagePicker extends Mock implements ImagePicker {}

void main() {
  late PickImageBloc pickImageBloc;
  late MockImagePicker mockImagePicker;

  // final tFile = XFile(
  //   readFile(AppImageTest.roomObject)
  //       .path,
  // );

  setUp(() {
    mockImagePicker = MockImagePicker();
    pickImageBloc = PickImageBloc(picker: mockImagePicker);
    registerFallbackValue(ImageSource.gallery);
  });

  test('should return empty image state', () {
    expect(pickImageBloc.state, isA<EmptyImageState>());
  });

  // blocTest<PickImageBloc, PickImageState>(
  //   'emits [LoadingImageState] & [LoadedImageState] when PickImageFromSourceEvent is added.',
  //   build: () {
  //     when(() => mockImagePicker.pickImage(source: any(named: 'source')))
  //         .thenAnswer((_) async => tFile);
  //     return pickImageBloc;
  //   },
  //   act: (bloc) => bloc.add(
  //     const PickImageFromSourceEvent(source: ImageSource.gallery),
  //   ),
  //   expect: () => [
  //     LoadingImageState(),
  //     LoadedImageState(imageFile: tFile),
  //   ],
  // );

  blocTest<PickImageBloc, PickImageState>(
    'should emits [LoadingImageState] and [ErrorImageState] when an error occurs',
    build: () {
      when(() => mockImagePicker.pickImage(source: any(named: 'source')))
          .thenThrow(Exception('Unexpected error occurred.'));
      return pickImageBloc;
    },
    act: (bloc) => bloc.add(
      const PickImageFromSourceEvent(source: ImageSource.gallery),
    ),
    expect: () => [
      LoadingImageState(),
      const ErrorImageState(message: 'Unexpected error occurred.'),
    ],
  );
}
