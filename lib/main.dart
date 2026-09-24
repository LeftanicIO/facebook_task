import 'package:facebook_task2/screens/splash_screen.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(Facebook());
}

class Facebook extends StatelessWidget {
  const Facebook({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      home: SplashScreen(),
      
    );
  }
}






