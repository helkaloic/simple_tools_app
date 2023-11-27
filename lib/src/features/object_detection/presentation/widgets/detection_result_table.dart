import 'package:flutter/material.dart';
import 'package:simple_tools_app/src/core/extension/number.dart';
import 'package:simple_tools_app/src/core/widgets/text.dart';

import '../../domain/entities/object_detection.dart';
import 'detection_table_cell.dart';

class DetectionResultTableWidget extends StatelessWidget {
  const DetectionResultTableWidget({
    required this.list,
    super.key,
  });

  final List<ObjectDetectionEntity> list;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Table(
        border: TableBorder.all(color: Colors.grey.shade400),
        defaultVerticalAlignment: TableCellVerticalAlignment.middle,
        children: [
          // Header
          TableRow(
            decoration: BoxDecoration(color: Colors.grey.shade200),
            children: const [
              TableCell(
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Center(
                    child: TextCustom(
                      'Object name',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              TableCell(
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Center(
                    child: TextCustom(
                      'Accuracy (%)',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
          // Table body
          ...list
              .map((object) => TableRow(
                    children: [
                      DetectionTableCell(
                        text: object.label,
                      ),
                      DetectionTableCell(
                        text: object.confidence.toPercentageString,
                      ),
                    ],
                  ))
              .toList(),
        ],
      ),
    );
  }
}
