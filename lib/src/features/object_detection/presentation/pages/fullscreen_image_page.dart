import 'dart:io';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class FullScreenImagePage extends StatelessWidget {
  const FullScreenImagePage({
    required this.file,
    super.key,
  });

  final File file;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          GestureDetector(
            onTap: () => context.pop(),
            child: Container(color: Colors.black),
          ),
          Center(
            child: InteractiveViewer(
              minScale: 1,
              maxScale: 3,
              clipBehavior: Clip.none,
              child: Image.file(file),
            ),
          ),
        ],
      ),
    );
  }
}
