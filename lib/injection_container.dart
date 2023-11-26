import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:image_picker/image_picker.dart';
import 'package:simple_tools_app/src/app/routes/router.dart';
import 'package:simple_tools_app/src/core/typedef/typedefs.dart';
import 'package:simple_tools_app/src/core/util/file_checker.dart';
import 'package:simple_tools_app/src/features/object_detection/data/data_sources/object_detection_remote_data_source.dart';
import 'package:simple_tools_app/src/features/object_detection/data/repositories/object_detection_repository_impl.dart';
import 'package:simple_tools_app/src/features/object_detection/domain/repositories/object_detection_repository.dart';
import 'package:simple_tools_app/src/features/object_detection/domain/usecases/post_image_to_detect.dart';
import 'package:simple_tools_app/src/features/object_detection/presentation/bloc/object_detection/object_detection_bloc.dart';
import 'package:simple_tools_app/src/features/object_detection/presentation/bloc/pick_image/pick_image_bloc.dart';
import 'package:simple_tools_app/src/features/tool/data/data_sources/tool_local_data_source.dart';
import 'package:simple_tools_app/src/features/tool/data/repositories/tool_repository_impl.dart';
import 'package:simple_tools_app/src/features/tool/domain/repositories/tool_repository.dart';
import 'package:simple_tools_app/src/features/tool/domain/usecases/get_tool_info.dart';
import 'package:simple_tools_app/src/features/tool/domain/usecases/search_for_tool.dart';
import 'package:simple_tools_app/src/features/tool/presentation/bloc/search_tool_bloc.dart';

final sl = GetIt.instance;

FutureVoid setUpServiceLocator() async {
  //! External
  sl.registerLazySingleton(() => Dio());
  sl.registerLazySingleton(() => ImagePicker());

  //! App
  sl.registerLazySingleton(() => AppRouter());

  //! Core
  sl.registerLazySingleton(() => FileChecker());

  //! Feature: Object detection
  // Data source
  sl.registerLazySingleton<ObjectDetectionRemoteDataSource>(
    () => ObjectDetectionRemoteDataSourceImpl(dio: sl()),
  );

  // Repository
  sl.registerLazySingleton<ObjectDetectionRepository>(
    () => ObjectDetectionRepositoryImpl(remoteDataSource: sl()),
  );

  // Usecase
  sl.registerLazySingleton(() => PostImageToDetect(sl()));

  // Bloc
  sl.registerFactory(() => ObjectDetectionBloc(sl(), sl()));
  sl.registerFactory(() => PickImageBloc(picker: sl()));

  //! Feature: Home & search tools
  // Data source
  sl.registerLazySingleton<ToolLocalDataSource>(
    () => ToolLocalDataSourceImpl(),
  );

  // Repository
  sl.registerLazySingleton<ToolRepository>(
    () => ToolRepositoryImpl(dataSource: sl()),
  );

  // Usecase
  sl.registerLazySingleton(() => GetToolInfo(repository: sl()));
  sl.registerLazySingleton(() => SearchForTool(repository: sl()));

  // Bloc
  sl.registerFactory(() => SearchToolBloc(sl(), sl()));
}
