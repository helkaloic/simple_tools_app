import 'package:flutter/material.dart';
import 'package:simple_tools_app/src/features/home/presentation/page/home_page.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Simple Tools',
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
