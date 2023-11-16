import 'package:equatable/equatable.dart';

class ObjectDetectionEntity extends Equatable {
  final String label;
  final double confidence;

  const ObjectDetectionEntity({
    required this.label,
    required this.confidence,
  });

  @override
  List<Object?> get props => [label, confidence];
}
