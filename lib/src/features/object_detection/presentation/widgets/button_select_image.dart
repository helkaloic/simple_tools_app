import 'package:flutter/material.dart';
import 'package:simple_tools_app/src/core/widgets/gap.dart';

class ButtonSelectImage extends StatelessWidget {
  const ButtonSelectImage({
    super.key,
    required this.onPressed,
    required this.icon,
    required this.title,
    this.backgroundColor = Colors.blue,
  });

  final VoidCallback onPressed;
  final IconData icon;
  final String title;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        backgroundColor: MaterialStatePropertyAll(backgroundColor),
      ),
      child: Wrap(
        crossAxisAlignment: WrapCrossAlignment.center,
        children: [
          Icon(icon),
          const Gap(width: 8),
          Text(title),
        ],
      ),
    );
  }
}
