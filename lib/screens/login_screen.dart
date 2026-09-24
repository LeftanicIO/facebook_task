import 'package:facebook_task2/screens/home_screen.dart';
import 'package:facebook_task2/utils/colors.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  bool hidePassword = true; 
  bool showError = false; 


  final String correctEmail = 'route@gmail.com';
  final String correctPassword = 'Route#123';

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: .only(top: size.height * 0.06),
          child: Column(
            crossAxisAlignment: .stretch,
            children: [
              Icon(Icons.facebook, color: AppColors.blue, size: 100),
              SizedBox(height: size.height * 0.035),
              Padding(
                padding: .only(
                  left: size.width * 0.07,
                  right: size.width * 0.07,
                ),
                child: TextFormField(
                  controller: emailController,
                  onChanged: (_) {
                    if (showError) setState(() => showError = false);
                  },
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: AppColors.gray.withValues(alpha: 0.4),
                    hintText: "Mobile Number or Email address",
                    hintStyle: TextStyle(fontSize: 18, color: AppColors.gray),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: .circular(18),
                      borderSide: BorderSide(color: AppColors.gray),
                    ),
                    disabledBorder: OutlineInputBorder(
                      borderRadius: .circular(18),
                      borderSide: BorderSide(color: AppColors.gray),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: .circular(18),
                      borderSide: BorderSide(color: AppColors.gray),
                    ),
                  ),
                ),
              ),
              SizedBox(height: size.height * 0.035),
              Padding(
                padding: .only(
                  left: size.width * 0.07,
                  right: size.width * 0.07,
                ),
                child: TextFormField(
                  controller: passwordController,
                  obscureText: hidePassword,
                  onChanged: (_) {

                    if (showError) setState(() => showError = false);
                  },
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: AppColors.gray.withValues(alpha: 0.4),
                    hintText: "Enter Password",
                    hintStyle: TextStyle(fontSize: 18, color: AppColors.gray),
                    suffixIcon: IconButton(
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onPressed: () {
                        setState(() {
                          hidePassword = !hidePassword;
                        });
                      },
                      icon: Icon(
                        hidePassword ? Icons.visibility_off : Icons.visibility,
                        color: AppColors.gray,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: .circular(18),
                      borderSide: BorderSide(color: AppColors.gray),
                    ),
                    disabledBorder: OutlineInputBorder(
                      borderRadius: .circular(18),
                      borderSide: BorderSide(color: AppColors.gray),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: .circular(18),
                      borderSide: BorderSide(color: AppColors.black),
                    ),
                  ),
                ),
              ),

              
              if (showError)
                Padding(
                  padding: EdgeInsets.only(left: size.width * 0.07, top: 8),
                  child: const Text(
                    'Invalid email or password',
                    style: TextStyle(color: Colors.red, fontSize: 14),
                  ),
                ),

              SizedBox(height: size.height * 0.05),
              Padding(
                padding: .only(
                  left: size.width * 0.07,
                  right: size.width * 0.07,
                ),
                child: InkWell(
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  onTap: () {
                    if (emailController.text.trim() == correctEmail &&
                        passwordController.text == correctPassword) {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (context) => const HomeScreen(),
                        ),
                      );
                    } else {
                      setState(() {
                        showError = true;
                      });
                    }
                  },
                  child: Container(
                    padding: .symmetric(horizontal: 70, vertical: 20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(18),
                      color: AppColors.blue,
                    ),
                    alignment: .center,
                    child: Text(
                      'Login',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: size.height * 0.035),
              Center(
                child: TextButton(
                  onPressed: () {},
                  child: Text(
                    'Forgotten Password ?',
                    style: TextStyle(color: AppColors.gray, fontSize: 18),
                  ),
                ),
              ),
              Spacer(),
              Padding(
                padding: .only(
                  left: size.width * 0.07,
                  right: size.width * 0.07,
                ),
                child: InkWell(
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () {},
                  child: Container(
                    padding: .symmetric(horizontal: 70, vertical: 20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(18),
                      border: Border.all(color: AppColors.blue, width: 2.0),
                      color: Colors.transparent,
                    ),
                    alignment: .center,
                    child: Text(
                      'Create Account',
                      style: TextStyle(
                        color: AppColors.blue,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
              Image.asset('assets/images/meta.png'),
            ],
          ),
        ),
      ),
    );
  }
}
