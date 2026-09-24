
import 'package:flutter/material.dart';

class ButtonIcon extends StatelessWidget {
  final String name ;
  final Color choice;
  const ButtonIcon({super.key, required this.name, required this.choice});

  @override
  Widget build(BuildContext context) {
    return IconButton(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onPressed: () {},
            icon: ImageIcon(
              AssetImage('assets/icons/$name.png'),
              color: choice,
              size: 25,
            ),
          );
  }
}