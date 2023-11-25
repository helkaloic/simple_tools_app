import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:image_picker/image_picker.dart';

part 'pick_image_event.dart';
part 'pick_image_state.dart';

class PickImageBloc extends Bloc<PickImageEvent, PickImageState> {
  final ImagePicker picker;

  PickImageBloc({required this.picker}) : super(EmptyImageState()) {
    on<PickImageFromSourceEvent>(_pickImageFromSourceEvent);
    on<ClearImageEvent>(_clearImageEvent);
  }

  _pickImageFromSourceEvent(
    PickImageFromSourceEvent event,
    Emitter<PickImageState> emit,
  ) async {
    emit(LoadingImageState());

    try {
      final file = await picker.pickImage(
        source: event.source,
        maxHeight: 2000,
        maxWidth: 2000,
      );
      if (file != null) {
        emit(LoadedImageState(imageFile: file));
      } else {
        emit(const ErrorImageState(
          message: 'No image selected.',
        ));
      }
    } catch (e) {
      emit(const ErrorImageState(
        message: 'Unexpected error occurred.',
      ));
    }
  }

  _clearImageEvent(
    ClearImageEvent event,
    Emitter<PickImageState> emit,
  ) {
    emit(EmptyImageState());
  }
}
