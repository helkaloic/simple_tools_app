import 'package:simple_tools_app/src/features/object_detection/domain/entities/object_detection.dart';

class ObjectDetectionModel extends ObjectDetectionEntity {
  const ObjectDetectionModel({
    required super.label,
    required super.confidence,
  });

  factory ObjectDetectionModel.fromJson(Map<String, dynamic> json) {
    return ObjectDetectionModel(
      label: json['label'] as String,
      confidence: double.parse((json['confidence'] as String)),
    );
  }

  Map<String, dynamic> toJson() => {
        'label': label,
        'confidence': confidence,
      };

  ObjectDetectionEntity toEntity() => ObjectDetectionEntity(
        label: label,
        confidence: confidence,
      );
}
