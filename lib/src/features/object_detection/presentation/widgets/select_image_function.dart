import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:simple_tools_app/src/app/constants/app_string.dart';
import 'package:simple_tools_app/src/app/routes/router.dart';
import 'package:simple_tools_app/src/core/widgets/gap.dart';
import 'package:simple_tools_app/src/features/object_detection/presentation/bloc/pick_image/pick_image_state_extension.dart';

import '../../../../core/extension/build_context.dart';
import '../bloc/object_detection/object_detection_bloc.dart';
import '../bloc/pick_image/pick_image_bloc.dart';
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
    context.read<PickImageBloc>().add(PickImageFromSourceEvent(
          source: source,
        ));
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
                color: Colors.grey.withOpacity(.3),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: state.when(
                  empty: () => const Text(
                    AppStringConst.noImageSelectedMessage,
                    style: TextStyle(color: Colors.grey),
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
                  icon: Icons.photo_library_outlined,
                  title: 'Gallery',
                  backgroundColor: Colors.indigo,
                ),
                ButtonSelectImage(
                  onPressed: () => onSelectedImageSource(
                    context,
                    state,
                    ImageSource.camera,
                  ),
                  icon: Icons.camera_alt_outlined,
                  title: 'Camera',
                  backgroundColor: Colors.cyan,
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
