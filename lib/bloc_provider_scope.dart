import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'injection_container.dart';
import 'src/features/object_detection/presentation/bloc/object_detection/object_detection_bloc.dart';
import 'src/features/object_detection/presentation/bloc/pick_image/pick_image_bloc.dart';
import 'src/features/tool/presentation/bloc/search_tool_bloc.dart';

class BlocProviderScope extends StatelessWidget {
  final Widget child;
  const BlocProviderScope({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => sl<SearchToolBloc>()..add(LoadAllToolsEvent()),
        ),
        BlocProvider(create: (_) => sl<PickImageBloc>()),
        BlocProvider(create: (_) => sl<ObjectDetectionBloc>()),
      ],
      child: child,
    );
  }
}
