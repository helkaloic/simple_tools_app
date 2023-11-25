import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:simple_tools_app/src/app/theme/app_theme.dart';
import 'package:simple_tools_app/src/features/object_detection/presentation/bloc/object_detection/object_detection_bloc.dart';
import 'package:simple_tools_app/src/features/object_detection/presentation/bloc/pick_image/pick_image_bloc.dart';

import '../injection_container.dart';
import 'app/routes/router.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => sl<PickImageBloc>()),
        BlocProvider(create: (_) => sl<ObjectDetectionBloc>()),
      ],
      child: ScreenUtilInit(
        designSize: const Size(392.7, 826.9),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (_, __) => MaterialApp.router(
          title: 'Simple Tools',
          debugShowCheckedModeBanner: false,
          routerConfig: sl<AppRouter>().router,
          theme: defaultAppTheme,
        ),
      ),
    );
  }
}
