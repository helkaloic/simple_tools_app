import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:simple_tools_app/src/app/resources/assets.dart';
import 'package:simple_tools_app/src/app/routes/router.dart';
import 'package:simple_tools_app/src/app/theme/app_color.dart';
import 'package:simple_tools_app/src/core/widgets/gap.dart';
import 'package:simple_tools_app/src/features/object_detection/presentation/blocs/pick_image/pick_image_state_extension.dart';

import '../../../../core/extension/build_context.dart';
import '../blocs/object_detection/object_detection_bloc.dart';
import '../blocs/pick_image/pick_image_bloc.dart';
import 'button_select_image.dart';

class SelectImageFunctionWidget extends StatelessWidget {
  const SelectImageFunctionWidget({super.key});

  void onSelectedImageSource(
    BuildContext context,
    PickImageState state,
    ImageSource source,
  ) {
    if (state is LoadingImageState) return;
    context.read<ObjectDetectionBloc>().add(ClearObjectDetectionResult());
    context.read<PickImageBloc>().add(
          PickImageFromSourceEvent(source: source),
        );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PickImageBloc, PickImageState>(
      builder: (_, state) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Image frame
            Container(
              height: context.screenHeight / 3,
              width: context.screenWidth,
              decoration: BoxDecoration(
                color: AppColor.superLightPrimary,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: state.when(
                  empty: () => SvgPicture.asset(
                    AppSvg.noImage,
                    height: 60.h,
                    width: 60.w,
                  ),
                  loading: () => const SizedBox(
                    height: 20,
                    width: 20,
                    child: CircularProgressIndicator(),
                  ),
                  loaded: (file) {
                    return GestureDetector(
                      onTap: () => context.go(
                        AppRoutes.objectDetectionImage,
                        extra: File(file.path),
                      ),
                      child: Image.file(
                        File(file.path),
                        fit: BoxFit.cover,
                      ),
                    );
                  },
                  error: (error) => Text(error),
                ),
              ),
            ),
            const Gap(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ButtonSelectImage(
                  onPressed: () => onSelectedImageSource(
                    context,
                    state,
                    ImageSource.gallery,
                  ),
                  icon: AppSvg.gallery,
                  title: 'Gallery',
                ),
                Gap(width: 20.w),
                ButtonSelectImage(
                  onPressed: () => onSelectedImageSource(
                    context,
                    state,
                    ImageSource.camera,
                  ),
                  icon: AppSvg.camera,
                  title: 'Camera',
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
