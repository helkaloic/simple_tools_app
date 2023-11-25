import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'injection_container.dart' as di;
import 'src/app.dart';

void main() async {
  await dotenv.load(fileName: ".env");
  await di.setUpServiceLocator();
  runApp(const MainApp());
}
