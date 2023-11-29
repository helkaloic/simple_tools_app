import 'package:fpdart/fpdart.dart';
import 'package:image_picker/image_picker.dart';
import 'package:simple_tools_app/src/core/error/failure.dart';

class FileChecker {
  Either<Failure, XFile> checkImage(XFile? file) {
    return file != null
        ? Right(file)
        : const Left(NoFileFailure('No file selected!'));
  }
}
