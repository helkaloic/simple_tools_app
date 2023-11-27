import 'package:flutter/material.dart';
import 'package:simple_tools_app/src/features/object_detection/domain/entities/object_detection.dart';
import 'package:simple_tools_app/src/features/object_detection/presentation/blocs/object_detection/object_detection_bloc.dart';

extension ObjectDetectionStateExtension on ObjectDetectionState {
  Widget when({
    required Widget Function() empty,
    required Widget Function() loading,
    required Widget Function(List<ObjectDetectionEntity> list) loaded,
    required Widget Function(String error) error,
  }) {
    switch (runtimeType) {
      case EmptyDetectionState:
        return empty();
      case LoadingDetectionState:
        return loading();
      case LoadedDetectionState:
        return loaded((this as LoadedDetectionState).list);
      case ErrorDetectionState:
        return error((this as ErrorDetectionState).message);
      default:
        return empty();
    }
  }
}
