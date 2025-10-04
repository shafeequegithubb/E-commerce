import 'package:ecommerce_spinecode/core%20/constant/color_constant.dart';
import 'package:ecommerce_spinecode/feature/auth/data/model/auth_model.dart';
import 'package:ecommerce_spinecode/feature/auth/data/repositories/repositories.dart';
import 'package:ecommerce_spinecode/feature/auth/data/validaion/validation.dart';
import 'package:ecommerce_spinecode/feature/auth/presentation/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final nameController = TextEditingController();
    final emailController = TextEditingController();
    final passController = TextEditingController();
    final confirmPassController = TextEditingController();
    final formKey = GlobalKey<FormState>();

    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(15),
            child: Container(
              padding: EdgeInsets.all(24.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
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
                      "Create Account",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: ColorConstants.loginblue,
                      ),
                    ),
                    SizedBox(height: 30),

                    TextFormField(
                      controller: nameController,
                      validator: (value) =>
                          AuthValidation.isValidName(value ?? ""),
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.person_outline),
                        labelText: "Full Name",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                    SizedBox(height: 16),

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
                    const SizedBox(height: 16),

                    // Password
                    TextFormField(
                      controller: passController,
                      obscureText: true,
                      validator: (value) =>
                          AuthValidation.isValidPassword(value ?? ""),
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.lock_outline),
                        labelText: "Password",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),

                    // Confirm Password
                    TextFormField(
                      controller: confirmPassController,
                      obscureText: true,
                      validator: (value) {
                        if (value != passController.text) {
                          return "Passwords do not match";
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.lock_reset_outlined),
                        labelText: "Confirm Password",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),

                    const SizedBox(height: 28),

                    // Register Button
                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: ColorConstants.loginblue,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            context.read<LoginServices>().onRegister(
                              UserModel(
                                "customer",
                                name: nameController.text.trim(),
                                email: emailController.text.trim(),
                                pass: passController.text.trim(),
                              ),
                              context,
                            );
                          }
                        },
                        child: Text(
                          "Create Account",
                          style: TextStyle(
                            color: ColorConstants.mainwhite,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),

                    SizedBox(height: 25),

                    // Already have account
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Already have an account? "),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (_) => const LoginScreen(),
                              ),
                            );
                          },
                          child: Text(
                            "Log in",
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
