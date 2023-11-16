import 'package:get_it/get_it.dart';
import 'package:simple_tools_app/src/app/routes/router.dart';
import 'package:simple_tools_app/src/core/typedef/typedefs.dart';

final sl = GetIt.instance;

FutureVoid setUpServiceLocator() async {
  //! App
  sl.registerLazySingleton(() => AppRouter());
}
