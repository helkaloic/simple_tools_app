part of 'pick_image_bloc.dart';

sealed class PickImageState extends Equatable {
  const PickImageState();

  @override
  List<Object> get props => [];
}

final class EmptyImageState extends PickImageState {}

final class LoadingImageState extends PickImageState {}

final class LoadedImageState extends PickImageState {
  final XFile imageFile;

  const LoadedImageState({required this.imageFile});

  @override
  List<Object> get props => [imageFile];
}

final class ErrorImageState extends PickImageState {
  final String message;

  const ErrorImageState({required this.message});

  @override
  List<Object> get props => [message];
}
