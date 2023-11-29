import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:fpdart/fpdart.dart';
import 'package:simple_tools_app/src/app/constants/app_string.dart';
import 'package:simple_tools_app/src/core/error/failure.dart';
import 'package:simple_tools_app/src/core/typedef/typedefs.dart';

class ConnectionChecker {
  FutureEither<bool> get isConnected async {
    final result = await Connectivity().checkConnectivity();
    if (result != ConnectivityResult.none ||
        result == ConnectivityResult.bluetooth) {
      return const Left(ConnectionFailure(
        AppStringConst.internetFailureMessage,
      ));
    }
    return const Right(true);
  }
}
