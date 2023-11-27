part of 'object_detection_bloc.dart';

sealed class ObjectDetectionState extends Equatable {
  const ObjectDetectionState();

  @override
  List<Object> get props => [];
}

final class EmptyDetectionState extends ObjectDetectionState {}

final class LoadingDetectionState extends ObjectDetectionState {}

final class LoadedDetectionState extends ObjectDetectionState {
  final List<ObjectDetectionEntity> list;

  const LoadedDetectionState({required this.list});

  @override
  List<Object> get props => [list];
}

final class ErrorDetectionState extends ObjectDetectionState {
  final String message;

  const ErrorDetectionState({required this.message});

  @override
  List<Object> get props => [message];
}
