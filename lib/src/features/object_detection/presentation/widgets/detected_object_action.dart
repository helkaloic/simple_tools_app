import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_tools_app/src/app/constants/app_string.dart';
import 'package:simple_tools_app/src/core/widgets/gap.dart';
import 'package:simple_tools_app/src/features/object_detection/presentation/bloc/object_detection/object_detection_state_extension.dart';

import '../../../../core/extension/build_context.dart';
import '../bloc/object_detection/object_detection_bloc.dart';
import '../bloc/pick_image/pick_image_bloc.dart';
import 'detection_result_table.dart';

class DetectedObjectActionWidget extends StatelessWidget {
  const DetectedObjectActionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ObjectDetectionBloc, ObjectDetectionState>(
      builder: (_, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              width: context.screenWidth,
              child: ElevatedButton(
                onPressed: () {
                  if (state is LoadingDetectionState) return;
                  final imgState = context.read<PickImageBloc>().state;
                  context.read<ObjectDetectionBloc>().add(
                        SubmitImageToDetectObjectEvent(
                          imgFile: imgState is LoadedImageState
                              ? imgState.imageFile
                              : null,
                        ),
                      );
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(
                    context.watch<PickImageBloc>().state is LoadedImageState
                        ? state is LoadingDetectionState
                            ? Colors.green.shade200
                            : Colors.blue
                        : Colors.grey.shade400,
                  ),
                  shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  )),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  child: Text(
                    state is LoadingDetectionState ? 'PROCESSING...' : 'START',
                  ),
                ),
              ),
            ),
            const Gap(height: 20),
            if (state is! EmptyDetectionState) ...[
              const Text(
                'Detection results:',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Gap(height: 12),
              state.when(
                empty: () => Container(),
                loading: () => SizedBox(
                  height: context.screenHeight / 8,
                  child: const Center(
                    child: SizedBox(
                      height: 20,
                      width: 20,
                      child: CircularProgressIndicator(),
                    ),
                  ),
                ),
                loaded: (list) => list.isNotEmpty
                    ? DetectionResultTableWidget(list: list)
                    : const Text(AppStringConst.objectNotFoundMessage),
                error: (error) => Text(error),
              ),
            ],
          ],
        );
      },
    );
  }
}
