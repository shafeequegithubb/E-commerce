import 'package:ecommerce_spinecode/core%20/constant/color_constant.dart';
import 'package:ecommerce_spinecode/feature/auth/data/repositories/repositories.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    User? user = FirebaseAuth.instance.currentUser;
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        title: Text("Profile"),
        backgroundColor: ColorConstants.primerygreen,
        centerTitle: true,
      ),
      body: Column(
        children: [
          SizedBox(height: 20),

          CircleAvatar(
            backgroundColor: Colors.grey.shade300,
            radius: 60,
            child: Icon(Icons.person, size: 50),
          ),
          SizedBox(height: 20),
          Text(
            "shafeeque mohd",
            style: TextStyle(color: ColorConstants.mainblack, fontSize: 20),
          ),
          Expanded(
            child: ListView(
              children: [
                profileOption(Icons.shopping_bag, "My Orders", () {}),
                profileOption(Icons.settings, "Settings", () {}),
                profileOption(Icons.payment, "Payment Methods", () {}),
                profileOption(Icons.help, "Help & Support", () {}),
                profileOption(Icons.logout, "Logout", () async {
                  context.read<LoginServices>().logout(context);
                }),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget profileOption(IconData icon, String title, void Function()? onTap) {
    return ListTile(
      leading: Icon(icon, color: ColorConstants.primerygreen),
      title: Text(title, style: TextStyle(fontSize: 16)),
      trailing: Icon(Icons.arrow_forward_ios, size: 16),
      onTap: onTap,
    );
  }
}
