import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:image_picker/image_picker.dart';
import 'package:simple_tools_app/src/app/services/navigation_service.dart';
import 'package:simple_tools_app/src/core/utils/connection_checker.dart';
import 'package:simple_tools_app/src/core/utils/file_checker.dart';
import 'package:simple_tools_app/src/features/object_detection/domain/entities/object_detection.dart';
import 'package:simple_tools_app/src/features/object_detection/domain/usecases/post_image_to_detect.dart';

part 'object_detection_event.dart';
part 'object_detection_state.dart';

class ObjectDetectionBloc
    extends Bloc<ObjectDetectionEvent, ObjectDetectionState> {
  final PostImageToDetect postImageToDetect;
  final FileChecker fileChecker;
  final ConnectionChecker connectionChecker;

  ObjectDetectionBloc(
    this.postImageToDetect,
    this.fileChecker,
    this.connectionChecker,
  ) : super(EmptyDetectionState()) {
    on<SubmitImageToDetectObjectEvent>(_onPostImageToDetectObjectEvent);
    on<ClearObjectDetectionResult>(_onClearObjectDetectionResult);
  }

  _onClearObjectDetectionResult(
    ClearObjectDetectionResult event,
    Emitter<ObjectDetectionState> emit,
  ) {
    emit(EmptyDetectionState());
  }

  _onPostImageToDetectObjectEvent(
    SubmitImageToDetectObjectEvent event,
    Emitter<ObjectDetectionState> emit,
  ) async {
    emit(LoadingDetectionState());

    final fileEither = fileChecker.checkImage(event.imgFile);

    await fileEither.fold(
      (fail) async {
        NavigationService().showMessage(fail.message);
        emit(ErrorDetectionState(message: fail.message));
      },
      (imageFile) async {
        final isConnected = await connectionChecker.isConnected;

        isConnected.fold(
          (fail) => emit(ErrorDetectionState(message: fail.message)),
          (r) async {
            final eitherFailureOrObj = await postImageToDetect(imageFile);
            eitherFailureOrObj.fold(
              (failure) => emit(ErrorDetectionState(message: failure.message)),
              (list) => emit(LoadedDetectionState(list: list)),
            );
          },
        );
      },
    );
  }
}
