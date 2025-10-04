import 'package:ecommerce_spinecode/core%20/constant/color_constant.dart';
import 'package:ecommerce_spinecode/feature/auth/data/repositories/repositories.dart';
import 'package:ecommerce_spinecode/feature/auth/data/validaion/validation.dart';
import 'package:ecommerce_spinecode/feature/auth/presentation/register_screen.dart';
import 'package:ecommerce_spinecode/feature/products/presentation/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Container(
              padding: EdgeInsets.all(24.0),
              decoration: BoxDecoration(
                color: ColorConstants.mainwhite,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: ColorConstants.mainblack,
                    blurRadius: 12,
                    offset: Offset(0, 6),
                  ),
                ],
              ),
              child: Form(
                key: formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.shopping_bag_outlined,
                      color: ColorConstants.loginblue,
                      size: 60,
                    ),
                    SizedBox(height: 10),
                    Text(
                      "Welcome Back",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: ColorConstants.loginblue,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      "Login to continue",
                      style: TextStyle(fontSize: 15, color: Colors.grey),
                    ),
                    SizedBox(height: 30),

                    // Email field
                    TextFormField(
                      controller: emailController,
                      validator: (value) =>
                          AuthValidation.isValidEmail(value ?? ""),
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.email_outlined),
                        labelText: "Email Address",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                    SizedBox(height: 16),

                    // Password field
                    TextFormField(
                      controller: passController,
                      validator: (value) =>
                          AuthValidation.isValidPassword(value ?? ""),
                      obscureText: true,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.lock_outline),
                        labelText: "Password",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),

                    SizedBox(height: 10),

                    // Forgot password text
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => HomeScreen(),
                            ),
                          );
                        },
                        child: Text(
                          "Forgot Password?",
                          style: TextStyle(
                            color: ColorConstants.loginblue,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),

                    SizedBox(height: 10),

                    // Login Button
                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blueAccent,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            context.read<LoginServices>().onLogin(
                              emailController.text.trim(),
                              passController.text.trim(),
                              context,
                            );
                          }
                        },
                        child: Text(
                          "Login",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 25),

                    // Register prompt
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Don't have an account? "),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (_) => RegisterScreen(),
                              ),
                            );
                          },
                          child: Text(
                            "Register",
                            style: TextStyle(
                              color: Colors.blueAccent.shade700,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
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
