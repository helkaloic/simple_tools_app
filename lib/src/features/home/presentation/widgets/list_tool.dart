import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../app/resources/assets.dart';
import '../../../../app/routes/router.dart';
import '../../../../core/widgets/gap.dart';
import 'tool_card.dart';

class ListToolWidget extends StatelessWidget {
  const ListToolWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: [
          ToolCardWidget(
            onTap: () => context.go(AppRoutes.objectDetection),
            title: 'Object Detection',
            description: 'Detect list of objects from an image.',
            icon: AppSvg.objectDetection,
          ),
          const Gap(height: 15),
          ToolCardWidget(
            onTap: () {},
            title: 'Object Detection',
            description: 'Detect list of objects from an image.',
            icon: AppSvg.objectDetection,
          ),
          const Gap(height: 15),
          ToolCardWidget(
            onTap: () {},
            title: 'Object Detection',
            description: 'Detect list of objects from an image.',
            icon: AppSvg.objectDetection,
          ),
        ],
      ),
    );
  }
}
