import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'bloc_provider_scope.dart';
import 'firebase_options.dart';
import 'injection_container.dart' as di;
import 'src/app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await di.setUpServiceLocator();

  runApp(
    const BlocProviderScope(child: MainApp()),
  );
}
