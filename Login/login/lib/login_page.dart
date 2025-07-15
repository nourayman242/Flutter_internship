import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:login/constants.dart';
import 'package:login/custom_button.dart';
import 'package:login/custom_field.dart';
import 'package:login/signup_page.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    return Scaffold(
      backgroundColor: backgroundcolor,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(maxWidth: 400),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      'Welcome Back!',
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8.h),
                    Text(
                      'Login to continue',
                      style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                    ),
                    SizedBox(height: 30.h),
                    CustomTextField(
                      hintText: "Email",
                      prefixIcon: Icons.email,
                      controller: emailController,
                    ),
                    SizedBox(height: 10.h),
                    CustomTextField(
                      hintText: "password",
                      prefixIcon: Icons.key,
                      controller: passwordController,
                      isPassword: true,
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () {},
                        child: Text(
                          'Forgot Password?',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey[700],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20.h),
                    CustomButton(
                      text: 'Login',
                      onPressed: () {
                        print("Login clicked");
                      },
                    ),
                    SizedBox(height: 20.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Don't have an account? "),
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                builder: (context) => SignupPage(),
                              ),
                            );
                          },
                          child: Text(
                            'Sign Up',
                            style: TextStyle(color: Color(0xFF1565C0)),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
