import 'package:equatable/equatable.dart';

class ToolEntity extends Equatable {
  final String title;
  final String body;
  final String icon;
  final String route;

  const ToolEntity({
    required this.title,
    required this.body,
    required this.icon,
    required this.route,
  });

  @override
  List<Object?> get props => [title, body, icon, route];
}
