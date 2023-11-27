import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart' show XFile;

import 'pick_image_bloc.dart';

extension PickImageStateExtension on PickImageState {
  Widget when({
    required Widget Function() empty,
    required Widget Function() loading,
    required Widget Function(XFile imageFile) loaded,
    required Widget Function(String error) error,
  }) {
    switch (runtimeType) {
      case EmptyImageState:
        return empty();
      case LoadingImageState:
        return loading();
      case LoadedImageState:
        return loaded((this as LoadedImageState).imageFile);
      case ErrorImageState:
        return error((this as ErrorImageState).message);
      default:
        return empty();
    }
  }
}
