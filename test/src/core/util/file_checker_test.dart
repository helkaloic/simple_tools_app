import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mocktail/mocktail.dart';
import 'package:simple_tools_app/src/core/error/failure.dart';
import 'package:simple_tools_app/src/core/util/file_checker.dart';

import '../../../helper/file_reader.dart';
import '../../app/resources/assets.dart';
import '../../features/object_detection/presentation/bloc/pick_image/pick_image_bloc_test.dart';

void main() {
  late MockImagePicker mockImagePicker;
  late FileChecker fileChecker;

  setUp(() {
    mockImagePicker = MockImagePicker();
    fileChecker = FileChecker();
    registerFallbackValue(ImageSource.gallery);
  });

  final tFile = XFile(
    readFile(AppImageTest.roomObject).path,
  );

  test(
    'should return invalid image file',
    () {
      // arrange
      when(() => mockImagePicker.pickImage(source: any(named: 'source')))
          .thenAnswer((_) async => null);
      // act
      final result = fileChecker.checkImage(null);
      // assert
      expect(result, const Left(NoFileFailure('No file selected!')));
    },
  );

  test('should return valid image file', () {
    // arrange
    when(() => mockImagePicker.pickImage(source: any(named: 'source')))
        .thenAnswer((_) async => tFile);
    // act
    final result = fileChecker.checkImage(tFile);
    // assert
    expect(result, Right(tFile));
  });
}
