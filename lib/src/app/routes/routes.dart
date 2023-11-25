part of 'router.dart';

class AppRoutes {
  AppRoutes._();
  static const init = '/';
  static const objectDetection = '/objectDetection';
  static const objectDetectionImage = '/objectDetection/image';

  static String pathName(String path) => path.substring(1);
}
