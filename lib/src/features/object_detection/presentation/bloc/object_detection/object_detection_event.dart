part of 'object_detection_bloc.dart';

sealed class ObjectDetectionEvent extends Equatable {
  const ObjectDetectionEvent();

  @override
  List<Object> get props => [];
}

class SubmitImageToDetectObjectEvent extends ObjectDetectionEvent {
  final XFile? imgFile;

  const SubmitImageToDetectObjectEvent({required this.imgFile});

  @override
  List<Object> get props => [imgFile!];
}

class ClearObjectDetectionResult extends ObjectDetectionEvent {
  @override
  List<Object> get props => [];
}
