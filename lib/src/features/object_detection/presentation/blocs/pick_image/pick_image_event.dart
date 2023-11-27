part of 'pick_image_bloc.dart';

sealed class PickImageEvent extends Equatable {
  const PickImageEvent();

  @override
  List<Object> get props => [];
}

class PickImageFromSourceEvent extends PickImageEvent {
  final ImageSource source;

  const PickImageFromSourceEvent({required this.source});

  @override
  List<Object> get props => [source];
}

class ClearImageEvent extends PickImageEvent {}
