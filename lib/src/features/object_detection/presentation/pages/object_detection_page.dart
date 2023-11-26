import 'package:flutter/material.dart';
import 'package:simple_tools_app/src/core/widgets/gap.dart';
import 'package:simple_tools_app/src/features/object_detection/presentation/widgets/detected_object_action.dart';
import 'package:simple_tools_app/src/features/object_detection/presentation/widgets/select_image_function.dart';

class ObjectDetectionPage extends StatelessWidget {
  const ObjectDetectionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Object detection'),
      ),
      body: const SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: 20,
            horizontal: 20,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SelectImageFunctionWidget(),
              Gap(height: 20),
              DetectedObjectActionWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
