import 'package:simple_tools_app/src/features/tool/domain/entities/tool.dart';

class ToolModel extends ToolEntity {
  const ToolModel({
    required super.title,
    required super.body,
    required super.icon,
    required super.route,
  });

  factory ToolModel.fromJson(Map<String, dynamic> json) {
    return ToolModel(
      title: json['title'],
      body: json['body'],
      icon: json['icon'],
      route: json['route'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'body': body,
      'icon': icon,
      'route': route,
    };
  }

  ToolEntity toEntity() => ToolEntity(
        title: title,
        body: body,
        icon: icon,
        route: route,
      );
}
