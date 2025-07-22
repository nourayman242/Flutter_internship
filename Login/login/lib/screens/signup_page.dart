import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:login/widgets/custom_button.dart';
import 'package:login/widgets/custom_field.dart';
import 'package:login/screens/login_page.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController usernamecontroller = TextEditingController();
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();

    return Scaffold(
      backgroundColor: Colors.white,
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
                      'Sign Up',
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    SizedBox(height: 8.h),
                    Text(
                      'Create your new account',
                      style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                    ),
                    SizedBox(height: 30.h),
                    CustomTextField(
                      hintText: "username",
                      prefixIcon: Icons.person,
                      controller: usernamecontroller,
                    ),
                    SizedBox(height: 5.h),
                    CustomTextField(
                      hintText: "Email",
                      prefixIcon: Icons.email,
                      controller: emailController,
                    ),
                    SizedBox(height: 5.h),
                    CustomTextField(
                      hintText: "password",
                      prefixIcon: Icons.key,
                      controller: passwordController,
                      isPassword: true,
                    ),
                    SizedBox(height: 5.h),
                    CustomTextField(
                      hintText: "confirm password",
                      prefixIcon: Icons.lock_outline,
                      controller: passwordController,
                      isPassword: true,
                    ),

                    SizedBox(height: 30.h),
                    CustomButton(
                      text: 'Sign up',
                      onPressed: () {
                        print("signup clicked");
                      },
                      color: Colors.deepPurple,
                      textColor: Colors.white,
                    ),

                    SizedBox(height: 20.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Already have an account? "),
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                builder: (context) => const LoginPage(),
                              ),
                            );
                          },
                          child: Text(
                            'Login',
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
