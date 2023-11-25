import 'package:flutter/material.dart';

class DetectionTableCell extends StatelessWidget {
  const DetectionTableCell({
    required this.text,
    super.key,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return TableCell(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(child: Text(text)),
      ),
    );
  }
}
