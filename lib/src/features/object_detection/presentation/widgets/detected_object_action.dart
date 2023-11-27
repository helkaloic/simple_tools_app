import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:simple_tools_app/src/app/constants/app_string.dart';
import 'package:simple_tools_app/src/app/theme/app_color.dart';
import 'package:simple_tools_app/src/core/widgets/gap.dart';
import 'package:simple_tools_app/src/core/widgets/text.dart';
import 'package:simple_tools_app/src/features/object_detection/presentation/blocs/object_detection/object_detection_state_extension.dart';

import '../../../../core/extension/build_context.dart';
import '../blocs/object_detection/object_detection_bloc.dart';
import '../blocs/pick_image/pick_image_bloc.dart';
import 'detection_result_table.dart';

class DetectedObjectActionWidget extends StatelessWidget {
  const DetectedObjectActionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ObjectDetectionBloc, ObjectDetectionState>(
      builder: (_, state) {
        final imgState = context.watch<PickImageBloc>().state;
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              width: context.screenWidth,
              child: GestureDetector(
                onTap: () {
                  if (state is LoadingDetectionState) return;
                  context.read<ObjectDetectionBloc>().add(
                        SubmitImageToDetectObjectEvent(
                          imgFile: imgState is LoadedImageState
                              ? imgState.imageFile
                              : null,
                        ),
                      );
                },
                child: AnimatedContainer(
                  duration: Durations.short4,
                  decoration: BoxDecoration(
                    color: AppColor.darkPrimary,
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  padding: EdgeInsets.symmetric(
                    vertical: 15.h,
                  ),
                  child: Center(
                    child: state is LoadingDetectionState
                        ? SizedBox(
                            height: 20.h,
                            width: 20.w,
                            child: const CircularProgressIndicator(
                              color: AppColor.white,
                              strokeWidth: 3,
                            ),
                          )
                        : const TextCustom(
                            'SCAN',
                            color: AppColor.white,
                            fontWeight: FontWeight.bold,
                          ),
                  ),
                ),
              ),
            ),
            const Gap(height: 20),
            if ((state is LoadedDetectionState) ||
                (state is ErrorDetectionState)) ...[
              const TextCustom(
                'Results:',
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: AppColor.darkPrimary,
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
                    : const TextCustom(AppStringConst.objectNotFoundMessage),
                error: (error) => Text(error),
              ),
            ],
          ],
        );
      },
    );
  }
}
