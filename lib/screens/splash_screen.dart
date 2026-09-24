import 'package:facebook_task2/utils/colors.dart';
import 'dart:async';
import 'login_screen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
 void initState() {
    super.initState();
    Timer(const Duration(seconds: 2), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const LoginScreen()),
      );
    });
  }
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(

          crossAxisAlignment: .center,
          children: [
            SizedBox(
              height: size.height * 0.2
              ),
            Icon(
              Icons.facebook, 
              color: AppColors.blue, size: 100
              ),
            Spacer(),
            Padding(
              padding: .only(top: 30),
              child: Column(
              crossAxisAlignment: .center,
                children: [
                  Text(
              'From',
              style: TextStyle(
                color:AppColors.gray,
                fontSize: 16,
              ),
              ),
              const SizedBox(height: 4,),
            Container(
              alignment: Alignment.center,
              child: Image.asset(
                'assets/images/meta.png',
                fit: BoxFit.contain,
              ),
            ),
                ],
              ),
              )
            
          ],
        ),
      ),
    );
  }
}
