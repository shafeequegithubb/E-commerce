import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_spinecode/core%20/constant/color_constant.dart';
import 'package:ecommerce_spinecode/feature/auth/data/model/auth_model.dart';
import 'package:ecommerce_spinecode/feature/auth/presentation/login_screen.dart';
import 'package:ecommerce_spinecode/feature/products/presentation/screens/admin_dashboard.dart';
import 'package:ecommerce_spinecode/feature/products/presentation/screens/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginServices with ChangeNotifier {
  final String collectionName = "spineuser";

  Future<void> onRegister(UserModel log, BuildContext context) async {
    try {
      UserCredential credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
            email: log.email.trim(),
            password: log.pass.trim(),
          );

      final user = credential.user;

      if (user == null) {
        throw Exception("User creation failed");
      }

      await FirebaseFirestore.instance
          .collection(collectionName)
          .doc(user.uid)
          .set({
            "name": log.name,
            "email": log.email,
            "role": "customer",
            "createdAt": FieldValue.serverTimestamp(),
          });

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: Colors.green,
          content: Text("Registration successful"),
        ),
      );

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => HomeScreen()),
      );
    } on FirebaseAuthException catch (e) {
      String errorMsg = e.message ?? "Registration failed.";
      if (e.code == 'weak-password') {
        errorMsg = "The password provided is too weak.";
      } else if (e.code == 'email-already-in-use') {
        errorMsg = "The account already exists for that email.";
      }
      showErrorSnackBar(context, errorMsg);
    } catch (e) {
      showErrorSnackBar(context, "Something went wrong: $e");
      print(e);
    }
  }

  Future<void> onLogin(String email, String pass, BuildContext context) async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email.trim(),
        password: pass.trim(),
      );

      String uid = credential.user!.uid;

      DocumentSnapshot userDoc = await FirebaseFirestore.instance
          .collection(collectionName)
          .doc(uid)
          .get();

      if (!userDoc.exists) {
        throw Exception("User profile not found");
      }

      String role = userDoc.get("role") ?? "customer";

      if (role == "admin") {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => AdminDashboard()),
        );
      } else if (role == "customer") {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => HomeScreen()),
        );
      } else {
        showErrorSnackBar(context, "Role not recognized");
      }
    } on FirebaseAuthException catch (e) {
      String errorMsg = "invalid email or password.";
      if (e.code == 'user-not-found') {
        errorMsg = "No user found for this email.";
      } else if (e.code == 'wrong-password') {
        errorMsg = "Incorrect password provided.";
      }
      showErrorSnackBar(context, errorMsg);
    } catch (e) {
      showErrorSnackBar(context, "Something went wrong: ");
    }
  }

  Future<void> logout(BuildContext context) async {
    try {
      await FirebaseAuth.instance.signOut();

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: Colors.grey,
          content: Text("Logged out "),
        ),
      );

      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (_) => LoginScreen()),
        (route) => false,
      );
    } catch (e) {
      showErrorSnackBar(context, "Logout failed: $e");
    }
  }

  void showErrorSnackBar(BuildContext context, String message) {
    if (context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(backgroundColor: ColorConstants.error, content: Text(message)),
      );
    }
  }
}
