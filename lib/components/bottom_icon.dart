import 'package:flutter/material.dart';

class BottomIcon extends StatelessWidget {
  const BottomIcon({Key? key, required this.icon,this.func}): super(key: key);
  final IconData icon;
  final Function()? func;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: func,
      child: Icon(
        icon,
        size: 27.0,
      ),
    );
  }
}